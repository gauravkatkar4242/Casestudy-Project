class DashboardController < ApplicationController
	load_and_authorize_resource :class => false


	def admin
		
	end

	def candidate
	end
	
	def assessor
	end

	def content_creator
	end

	def user_permissions
		@user = User.all
		@role_user = RoleUser.all
		@cs = Casestudy.all
		@csu = CasestudyUser.all
	end


	def update_role
		id = params[:role_id]
		user_id = params[:user_id]
		if User.find(user_id).roles.exists?(id)
			RoleUser.find_by(user_id: params[:user_id], role_id: params[:role_id]).delete
		else
			# RoleUser.create(user_id: params[:user_id], role_id: params[:role_id])
			RoleUser.create(role_user_param)
		end
		redirect_to user_permissions_path
	end

	def role_user_param
		# sraise params.inspect
		 params.permit(:user_id,:role_id)
	end
end