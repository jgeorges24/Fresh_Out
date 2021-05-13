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

    #helper to disinguish if its the mixtape creator or not
    def mixtape_true_creator
        @tape = Tape.find_by(id: params[:id])
        @current_user == @tape.user

    end
    def not_mixtape_true_creator
        @tape = Tape.find_by(id: params[:id])
        @current_user != @tape.user
        redirect_to tapes_path(@tape)

    end

    def my_opinion
        @tape = Tape.find_by(id: params[:tape_id])
        #binding.pry
        @current_user.opinions.includes?() == @tape.opinions

        # @tapes = user.tapes
        # @opinions = user.opinions
        # @tape = Tape.find_by_id(params[:tape_id])
        # @opinion = @tape.opinions.find(params[:id])
    end
    
def not_user_opinion
    @tape = Tape.find_by(id: params[:tape_id])
    @current_user.opinions != @tape.opinions
    redirect_to tape_path(@tape)
end

    def true_user_opinion

        

    end

    def tape_Opinion_count
        @tape = Tape.find_by(id: params[:id])
        @tape.opinions.count

    end



end


