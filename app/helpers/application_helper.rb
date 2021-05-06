module ApplicationHelper

    def current_user

        @user ||= User.find_by_id(sessions[:user_id])

    end

    



end
