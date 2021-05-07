class UsersController < ApplicationController

    def index 
        @users = User.all
    end

    def show 
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
                flash[:message] = @user.errors.full_messages.to_sentence
                #flash[:message] = "missing info"
                render :new
                #flash[:notice] = "username is not proper"
            end
    end


    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end

end
