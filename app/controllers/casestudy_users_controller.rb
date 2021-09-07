class CasestudyUsersController < ApplicationController
	load_and_authorize_resource :except => [:create_user_and_assign_casestudy_form, :create_user_and_assign_casestudy]
	def index
		@casestudy_users = CasestudyUser.all
	end
	def new
		@casestudy_user = CasestudyUser.new
		@user = Role.find_by(name: "Candidate").users
		@assessor = Role.find_by(name: "Assessor").users
		@cs = Casestudy.all
	end
	def create
		# raise params.inspect
		@casestudy_user = CasestudyUser.new(casestudy_user_params)
		if @casestudy_user.save
			redirect_to casestudy_users_path, notice: "Casestudy assigned successfully"
		else 
			redirect_to casestudy_users_path, notice: @casestudy_user.errors.messages.inspect
		end
	end

	def create_user_and_assign_casestudy_form
	end

	def create_user_and_assign_casestudy
		# raise params.inspect

		user = WalkInTests.new(params: params.permit(:casestudy_id, :assessor_id, :name, :email, :passkey)).try
		if user.class == User
			sign_in user
			redirect_to casestudy_user_user_responses_path(CasestudyUser.find_by(user: user, casestudy_id: params[:casestudy_id]))
		else
			redirect_to walk_in_tests_path(params[:casestudy_id],params[:assessor_id]), notice: user
		end
		# raise params.inspect
	end

	

	def casestudy_user_params
    	params.require(:casestudy_user).permit(:user_id, :assessor_id, :casestudy_id)
    end
end
