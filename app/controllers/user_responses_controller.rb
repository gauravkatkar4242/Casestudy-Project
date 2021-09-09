class UserResponsesController < ApplicationController
	
	load_and_authorize_resource :except => [:update_time, :auto_submit]
	include ExamHelper
	
	def index
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
		if current_user != @casestudy_user.user
			redirect_to after_sign_in_path_for(current_user), notice: "You can't Access this CasestudyUser"

		elsif @casestudy_user.status == 'submitted_but_not_assessed' or @casestudy_user.status == 'submitted_and_assessed'
			sign_out current_user
			redirect_to after_sign_in_path_for(current_user), notice: "You have already submitted Exam in INdex"
		end	
	end

	def exam
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
		@time = @casestudy.duration
		if current_user != @casestudy_user.user
			redirect_to after_sign_in_path_for(current_user), notice: "You can't Access this CasestudyUser"
		
		elsif @casestudy_user.status == 'not_started'
			init_exam()
			start_exam()


			ExampleJob.set(wait: 5.minutes).perform_later(@casestudy_user.id)


		elsif @casestudy_user.status == 'in_progress'

		elsif @casestudy_user.status == 'submitted_but_not_assessed' or @casestudy_user.status == 'submitted_and_assessed'
			sign_out current_user
			redirect_to after_sign_in_path_for(current_user), notice: "You have already submitted Exam from Exam"
		end	 
	
	end
	def update

		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		if @casestudy_user.status != 'in_progress'
			sign_out current_user
			redirect_to after_sign_in_path_for(current_user), notice: "You have already submitted Exam in Update"
		else
			@user_reponse = UserResponse.find(params[:id])
			# raise @user_reponse.inspect

		    if @user_reponse.update(response_params)
		      redirect_to casestudy_user_start_exam_path(@casestudy_user),  notice: "Answer saved"
		    else
			  redirect_to casestudy_user_start_exam_path(@casestudy_user), notice: "Something is Wrong... Ans is not saved" 
		    end
		end
	end
	def update_time
		@casestudy_user = CasestudyUser.find(params[:casestudy_user])
			
		if @casestudy_user.status != 'in_progress'
			sign_out current_user
			redirect_to after_sign_in_path_for(current_user), notice: "You have already submitted Exam in Update"
		else
			@casestudy_user.update(time_elapsed: params[:time])
			puts @casestudy_user.time_elapsed
		end
		# ExampleJob.perform_now(@casestudy_user.id)
	end

	def submit
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		if @casestudy_user.status != 'in_progress'
			sign_out current_user
			redirect_to after_sign_in_path_for(current_user), notice: "You have already submitted Exam in subbmit"
		end	
		final_submit(@casestudy_user.id)
		sign_out current_user
		redirect_to root_path, notice: "Exam Submitted Successfully and Logged out"
	end

	def auto_submit
		 @casestudy_user = CasestudyUser.find(params[:id])
		 final_submit(@casestudy_user.id)
		 redirect_to root_path, notice: "Time Up....Exam Submitted Successfully"
	end

	private
	def response_params
    	params.require(:user_response).permit(:response)
    end
end