class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(user)
		if user == nil
			user_session_path
		elsif user.roles.exists?(name: "Admin")
			admin_dashboard_path
		elsif user.roles.exists?(name: "Content Creator")
			content_creator_dashboard_path
		elsif user.roles.exists?(name: "Assessor")
			assessor_dashboard_path
		elsif user.roles.exists?(name: "Candidate")
			candidate_dashboard_path
		else
			test_path
		end	
	end

	rescue_from CanCan::AccessDenied do |exception|
        redirect_to after_sign_in_path_for(current_user), :alert => exception.message
    end

	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
	end


end
