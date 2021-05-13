class OpinionsController < ApplicationController
    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]
    before_action :not_user_opinion, only: [:destroy]
    def create
        @tape = Tape.find_by_id(params[:tape_id])
        @opinion = @tape.opinions.build(opinion_params)
        if @opinion.save
            flash[:message] = "opinion added"
            redirect_to tape_path(@tape)
        else
            flash[:message] = "opinion NOT added"
            redirect_to tape_path(@tape)
        end

    end

    def destroy
    

            @tape = Tape.find_by_id(params[:tape_id])
            @opinion = @tape.opinions.find(params[:id])
            @opinion.destroy
            flash[:message] = "opinion removed"
            redirect_to tape_path(@tape)

    end

    #new methods from review
    def opinion_count

        Opinion.group(:tape_id).count
        Opinion.group(:tape_id).count.max_by{|k, v| v }
        Opinion.group(:tape_id).count.max

    end

    def show
        #must have show method to show use of has many through method

    end

    private
    #Strongest params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :tape_id)
    end


end
