class OpinionsController < ApplicationController
    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]
    
    #before_action :not_user_opinion, only: [:destroy]
    
    def create
        #binding.pry

        @tape = Tape.find_by_id(params[:tape_id])
        @opinion = @tape.opinions.build(opinion_params)
        if @opinion.save
            flash[:message] = "opinion added"
            redirect_to tape_path(@tape)
        else
            flash[:message] = @opinion.errors.full_messages.to_sentence
            render :new
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

    def new
        #binding.pry
        
        @opinion = Opinion.new
        @tape = Tape.find_by_id(params[:tape_id])
       
    end

    def index
        @tape = Tape.find_by_id(params[:tape_id])
        @opinions = @tape.opinions
    end

    def show
        #must have show method to show use of has many through method
        @tape = Tape.find_by(id: params[:id])
        @opinion = @tape.opinions.find_by(params [:tape_id])
    end

    private
    #Strongest params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :tape_id)
    end
end
