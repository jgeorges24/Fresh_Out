class UsersController < ApplicationController



    def index 
        @user = User.find_by(id: session[:user_id] )

    end


    def new
        @user = User.new
    end

    def create 

        @user = User.new(user_params)
            if @user.save
                flash[:message] = "Sign Up Success!"
                session[:user_id] = @user.id
                redirect_to tapes_path
            else
                render :new
                #flash[:notice] = "username is not proper"
            end
    end

    def

private
def user_params
    params.require(:user).permit(:name, :username, :password, :email)
end

end
