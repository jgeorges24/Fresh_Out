class TapesController < ApplicationController

    def index
        @tapes = Tape.all
    end

    def show

        @tape = Tape.find_by(id: params[:id])

    end

    def new

        @tape = Tape.new

    end

    def create
        
        @tape = Tape.new(tape_params)
        #if @tape.save
            #redirect_to tape_path(@tape)
        #else

            #render :new

        #end


    end

    private
    #stronger params
    def tape_params
        params.require(:tape).permit(:title, :artist, :genre, :artcover, :features)
    end
end
