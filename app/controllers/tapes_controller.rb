class TapesController < ApplicationController

    def index
        @tapes = Tape.all
    end

    def show

        @tape = Tape.find_by(id: params[:id])
        #this is here to define to opinions section on the tape.rb
        @opinion = @tape.opinion.build
        #might add likes on this page or views
        
    end

    def new

        @tape = Tape.new

    end

    def create
        
        @tape = Tape.new(tape_params)
        if @tape.save
            redirect_to tape_path(@tape)
        else
            #ADD FLASH MESSAGE
            render :new

        end


    end

    def edit

        @tape = Tape.find_by(id: params[:id])

    end

    def update

        @tape = Tape.find_by(id: params[:id])
        @tape.update(tape_params)

        if @tape.valid?
            redirect_to tape_path(@tape)
        end

    end

    def destroy 
        @tape = Tape.find_by(id: params[:id])
        @tape.destroy
        redirect_to tapes_path

    end

    def home



    end  

    private
    #stronger params
    def tape_params
        params.require(:tape).permit(:title, :artist, :features, :artcover,)
    end
end
