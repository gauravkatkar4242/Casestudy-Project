class DashboardController < ApplicationController
	load_and_authorize_resource :class => false
	before_action :set_user, only: %i[update_role]


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
		if @user.roles.exists?(@role.id)
			RoleUser.find_by(user_id: @user.id, role_id: @role.id).delete
		else
			# RoleUser.create(user_id: params[:user_id], role_id: params[:role_id])
			RoleUser.create(role_user_param)
		end
		redirect_to user_permissions_path
	end
	private
    def set_user
      @user = User.find(params[:user_id])
      @role = Role.find(params[:role_id])

    end
	def role_user_param
		# sraise params.inspect
		 params.permit(:user_id,:role_id)
	end
end