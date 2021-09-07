class QuestionTraitsController < ApplicationController
	load_and_authorize_resource
	def destroy
		
		@question_trait = QuestionTrait.find(params[:id])
		@question = @question_trait.question
		@casestudy = @question.casestudy
	    @question_trait.destroy
	    redirect_to edit_casestudy_question_path(@casestudy, @question), notice: "trait removed successfully." 
  	end

end