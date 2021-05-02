class SessionsController < ApplicationController

    def new

    end

    def destroy
        session.destroy
        #redirect_to
    end

    def create
        
     @user = User.find_by(username: params[:user][:username])
        
     if @user && @user.authenticate(params[:user][:password])
        flash[:message] = "login successful"
        session[:user_id] = @user.id
        redirect_to tapes_path

     else
        flash[:message] = "login not good"
        
        render :new
     end

    end


end
