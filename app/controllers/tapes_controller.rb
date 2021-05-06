class TapesController < ApplicationController

    def index
        @tapes = Tape.all
    end

    def show
        @tape = Tape.find_by(id: params[:id])
        #this is here to define to opinions section on the tape.rb
        @opinion = @tape.opinions.build
        #might add likes on this page or views  
    end

    def new

        @tape = Tape.new

    end

    def create
        #@tape = Tape.new(tape_params)
        
        @tape = current_user.created_tapes.build(tape_params)
        
        if @tape.save
            redirect_to tape_path(@tape)
        else
            flash[:message] = @tape.errors.full_messages.to_sentence 
            #ADD FLASH MESSAGE
            render :new
            #render vs redirect??? 

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
        @tapes = Tape.all
    end  

    private
    #stronger params
    def tape_params
        params.require(:tape).permit(:title, :artist, :features, :artcover, :genre)
    end
end
