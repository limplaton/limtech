class SessionsController < ApplicationController
    def new
        render layout: "login"
    end

    def create
        user = Employee.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            log_in(user)
        else  
            flash[:messages] = "Incorrect Username or Password"
            redirect_to '/sessions/new'
        end
    end
    
    def destroy
        ActionCable.server.remote_connections.where(current_user: current_user).disconnect
        current_user.update(status: Employee.statuses[:offline])
        log_out if logged_in?
        redirect_to root_path
    end
end
