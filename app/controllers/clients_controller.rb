class ClientsController < ApplicationController
    before_action :set_client, only: %i[ show edit update destroy ]

    # GET /clients or /clients.json
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        if params[:query].present?
            @pagy, @clients = pagy(Client.where("client_id LIKE ?", "%#{params[:query]}%"))
        elsif params[:query1].present?
            @pagy, @clients = pagy(Client.where("first_name LIKE ?", "%#{params[:query1]}%"))
        elsif params[:query2].present?
            @pagy, @clients = pagy(Client.where("company_name LIKE ?", "%#{params[:query2]}%"))  
        else
            @pagy, @clients = pagy(Client.all)
        end
        @company = Client.all
    end

    # GET /clients/1 or /clients/1.json
    def show
    end

    # GET /clients/new
    def new
        @client = Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients or /clients.json
    def create
        @client = Client.new(client_params)

        respond_to do |format|
            if @client.save
                format.html { redirect_to clients_url, notice: "Client was successfully created." }
                format.json { render :show, status: :created, location: @client }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @client.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /clients/1 or /clients/1.json
    def update
        respond_to do |format|
            if @client.update(client_params)
                format.html { redirect_to clients_url, notice: "Client was successfully updated." }
                format.json { render :show, status: :ok, location: @client }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @client.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
        @client.destroy

        respond_to do |format|
            format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_client
            @client = Client.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def client_params
            params.require(:client).permit(:firt_name, :last_name, :username, :email, :password, :password_confirmation, :client_id, :phone, :company_name, :project_read, :project_write, :project_create, :project_delete, :task_read, :task_write, :task_create, :task_delete, :chat_read, :chat_write, :chat_create, :chat_delete, :timing_sheet_read, :timing_sheet_write, :timing_sheet_create, :timing_sheet_delete, :avatar)
        end
end
