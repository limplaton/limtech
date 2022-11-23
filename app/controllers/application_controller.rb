class ApplicationController < ActionController::Base
    include Pagy::Backend
    helper_method :current_user
    before_action :turbo_frame_request_variant
    before_action :set_current_user

    def current_user
        if session[:user_id]
          @current_user  = Employee.find(session[:user_id])
        end
    end
    
    def log_in(user)
        session[:user_id] = user.id
        cookies.encrypted[:user_id] = user.id
        @current_user = user
        redirect_to root_path
    end
      
    def logged_in?
        !current_user.nil?
    end
      
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def chatroom
        @chatroom = nil
    end

    private
        def turbo_frame_request_variant
            request.variant = :turbo_frame if turbo_frame_request?
        end

        def set_current_user
            Current.employee = current_user
        end
end
