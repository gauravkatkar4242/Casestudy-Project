class AssessorResponsesController < ApplicationController
	
	load_and_authorize_resource 
	
	def index
		# raise @assessor_responses.inspect
		# @assessor_responses = UserResponse.all
		@casestudy_users = CasestudyUser.all
	end

	def update
		@assessor_response = AssessorResponse.find(params[:id])
		@assessor_response.update(assessor_response_params)
		redirect_to edit_assessor_response_path(@assessor_response.casestudy_user_id), notice: "Assessor Response Updated Successfully"
	end

	def show
		# if can? :read, CasestudyUser.find(params[:casestudy_user_id])
		# 	@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		# else
		# redirect_to root_path, notice: "You are not Authorised to Access this content"

		# end
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		authorize! :read, @casestudy_user

	end

	def edit
		@casestudy_user = CasestudyUser.find(params[:id])
	end

	def final_submit
		@casestudy_user = CasestudyUser.find(params[:assessor_response_id])
		@casestudy_user.update(status: 'submitted_and_assessed')
		redirect_to assessor_responses_path, notice: "Assessor Responses Updated Successfully you can't modify it now"
	end

	private
	def assessor_response_params
    	params.require(:assessor_response).permit(:rating)
    end
end