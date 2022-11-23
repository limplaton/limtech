class DashboardController < ApplicationController
    after_action :set_status, :set_chatroom

    def index
        @current_user = current_user
        @chatroom = chatroom
        set_status
        set_chatroom

        

        redirect_to '/signin' unless @current_user
        @employees = Employee.all
        @clients = Client.all
    end

    private
        def set_status
            current_user.update!(status: Employee.statuses[:offline]) if current_user
        end

        def set_chatroom
            chatroom === nil
        end
end
