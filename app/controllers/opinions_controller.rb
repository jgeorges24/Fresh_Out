class OpinionsController < ApplicationController

    def create

        @tape = Tape.find_by_id(params[:image_id])

    end

    private
    #Strongest params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit()
    end


end
