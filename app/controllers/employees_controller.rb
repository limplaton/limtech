class EmployeesController < ApplicationController
    before_action :set_employee, only: %i[ show edit update destroy ]
    include RoomsHelper
    
    # GET /employees or /employees.json
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @employees = Employee.all

        if params[:query].present?
            @pagy, @employee = pagy(Employee.search_by_employee_id(params[:query]))
        elsif params[:query1].present?
            @pagy, @employee = pagy(Employee.search_by_first_name(params[:query1]))
        elsif params[:query2].present?
            @pagy, @employee = pagy(Employee.search_by_designation(params[:query2]))  
        else
           @pagy, @employee = pagy(Employee.all)
        end
        
        @designations = Designation.all
        @count = 0
    end

    # GET /employees/1 or /employees/1.json
    def show
        @user = Employee.find(params[:id])
        @current_user = current_user
        @users = Employee.all_except(@current_user)

        @room = Room.new
        @joined_rooms = current_user.joined_rooms
        @rooms = search_rooms

        @message = Message.new
        @chatroom = true;
        @current_user_id = current_user.id
        @room_name = get_name(@user, @current_user)
        @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)
        
        current_user.update(current_room: @single_room)

        pagy_messages = @single_room.messages.includes(:employee).order(created_at: :desc)
        @pagy, messages = pagy(pagy_messages, items: 15)
        @messages = messages.reverse
    
        render "rooms/index"
    end

    # GET /employees/new
    def new
        @employee = Employee.new
        @departments = Department.all
        @designations = Designation.all
    end

    # GET /employees/1/edit
    def edit
        @departments = Department.all
        @designations = Designation.all
    end

    # POST /employees or /employees.json
    def create
        @employee = Employee.new(employee_params)
        @departments = Department.all
        @designations = Designation.all
        
        respond_to do |format|
            if @employee.save
                format.html { redirect_to employees_url, notice: "Employee was successfully created." }
                format.json { render :show, status: :created, location: @employee }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @employee.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /employees/1 or /employees/1.json
    def update

        @departments = Department.all
        @designations = Designation.all
        respond_to do |format|
            if @employee.update(employee_params)
                format.html { redirect_to employees_url, notice: "Employee was successfully updated." }
                format.json { render :show, status: :ok, location: @employee }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @employee.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /employees/1 or /employees/1.json
    def destroy
        @employee.destroy

        respond_to do |format|
            format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_employee
            @employee = Employee.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def employee_params
            params.require(:employee).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :employee_id, :join_date, :phone, :company, :department, :designation, :holiday_read, :holiday_write, :holiday_create, :holiday_delete, :leave_read, :leave_write, :leave_create, :leave_delete, :timesheet_read, :timesheet_write, :timesheet_create, :timesheet_delete, :avatar)
        end

        def get_name(user1, user2)
            user = [user1, user2].sort
            "private_#{user[0].id}_#{user[1].id}"
        end
end
