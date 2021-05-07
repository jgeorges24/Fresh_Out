module ApplicationHelper

    def current_user

        @current_user ||= User.find_by_id(session[:user_id])

    end

    def logged_in?
        !!current_user
    end

    def logged_out?
        !current_user
    end

    def redirect_if_not_logged
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged
        redirect_to tapes_path if logged_in?
    end
    
end
