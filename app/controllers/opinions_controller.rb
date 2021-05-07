class OpinionsController < ApplicationController
    before_action :redirect_if_not_logged, only: [:create]
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
        redirect_to tape_path(@tape)

    end

    private
    #Strongest params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :tape_id)
    end


end
