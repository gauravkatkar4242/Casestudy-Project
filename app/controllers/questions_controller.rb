class QuestionsController < ApplicationController
	load_and_authorize_resource
	before_action :set_question, only: %i[show edit update destroy ]
	before_action :set_casestudy

	def index

	end

	def new
		@question = Question.new
	end

	def show
		
	end

	def edit
		@casestudy = Casestudy.find(params[:casestudy_id])
		@question = Question.find(params[:id])
		@trait = Trait.new
		@traits = Trait.all

		session[:fall_back_url] = request.url

	end

	def update
		# raise params.inspect
		@casestudy = Casestudy.find(params[:casestudy_id])
		@question = @casestudy.questions.find(params[:question][:id])
      if @question.update(question_params)
       	redirect_to session[:fall_back_url], notice: "Question was successfully Updated." 
      else
				redirect_to edit_casestudy_path(@casestudy), notice: "Something is Wrong"
    end
	end

	def assign_trait
		# raise params.inspect
		# @question = Question.find(params[:question_id])
		# trait = @question.traits.new(id: params[:trait][:id])
		trait = QuestionTrait.new(question_id: params[:question_id], trait_id: params[:trait][:id])
		if trait.save
			       	redirect_to session[:fall_back_url], notice: "Trait added successfully." 
		else
			redirect_to edit_casestudy_path(@casestudy), notice: trait.errors.messages 
		end

	end



	def create
		@question.casestudy_id = @casestudy.id
		@question = @casestudy.questions.new(question_params)
			if @question.save
				redirect_to edit_casestudy_path(@casestudy), notice: "Question added successfully."
			else
				redirect_to edit_casestudy_path(@casestudy), notice: "Something is Wrong"
			end
	end

	def destroy
    @question.destroy
    redirect_to edit_casestudy_path(@casestudy), notice: "Question was successfully destroyed." 
  end


	
	

	private

    def set_question
      @question = Question.find(params[:id])
    end
		def set_casestudy
	   	@casestudy = Casestudy.find(params[:casestudy_id])
		end
    def question_params
    	params.require(:question).permit(:body)
    end
    def question_trait_params
    	params.require(:trait).permit(:question_id,:trait_id)
    end
  
end
