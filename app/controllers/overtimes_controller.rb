class OvertimesController < ApplicationController
    before_action :set_overtime, only: %i[ show edit update destroy ]

    # GET /overtimes or /overtimes.json
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @overtime_employee = Overtime.where(status: "Approved").count
        @total = Overtime.where(status: "Approved").sum(:hours)
        @request = Overtime.where(status: "New").count
        @reject = Overtime.where(status: "Rejected").count
        @names = Employee.all.map { |r| r.first_name + " " + r.last_name }
        @pagy, @overtimes = pagy(Overtime.all)
    end

    # GET /overtimes/1 or /overtimes/1.json
    def show
    end

    # GET /overtimes/new
    def new
        @overtime = Overtime.new
        @employee = Employee.all
    end

    # GET /overtimes/1/edit
    def edit
        @employee = Employee.all
    end

    # POST /overtimes or /overtimes.json
    def create
        @overtime = Overtime.new(overtime_params)

        respond_to do |format|
            if @overtime.save
                format.html { redirect_to overtimes_url, notice: "Overtime was successfully created." }
                format.json { render :show, status: :created, location: @overtime }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @overtime.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /overtimes/1 or /overtimes/1.json
    def update
        respond_to do |format|
            if @overtime.update(overtime_params)
                format.html { redirect_to overtimes_url, notice: "Overtime was successfully updated." }
                format.json { render :show, status: :ok, location: @overtime }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @overtime.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /overtimes/1 or /overtimes/1.json
    def destroy
        @overtime.destroy

        respond_to do |format|
        format.html { redirect_to overtimes_url, notice: "Overtime was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_overtime
        @overtime = Overtime.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def overtime_params
        params.require(:overtime).permit(:name, :date, :hours, :description, :status, :approve)
        end
end
