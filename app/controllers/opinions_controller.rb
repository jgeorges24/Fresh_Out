class OpinionsController < ApplicationController

    def create
        @tape = Tape.find_by_id(params[:image_id])
        @opinion = @tape.opinions.build(opinion_params)
        if @opinion.save
            flash[:message] = "opinion added"
            redirect_to tape_path(@tape)
        else
            flash[:message] = "opinion NOT added"
            redirect_to tape_path(@tape)
        end

    end

    private
    #Strongest params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :artcover, :user_id)
    end


end
