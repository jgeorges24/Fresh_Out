class UsersController < ApplicationController
    before_action :redirect_if_logged, only: [:new, :create, :show, :index]
    
    
    def index 
        @users = User.all
    end

    def show 
        @user = User.find_by(username: params[:user][:username])
        #@user = current_user
        #@current_user
        @tapes = user.tapes
        @opinions = user.opinions
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
