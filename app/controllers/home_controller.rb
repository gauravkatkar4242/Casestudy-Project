class HomeController < ApplicationController
	def index
		if current_user == nil
			redirect_to user_session_path
		elsif current_user.roles.exists?(name: "Admin")
			redirect_to admin_dashboard_path
		elsif current_user.roles.exists?(name: "Content Creator")
			redirect_to content_creator_dashboard_path
		elsif current_user.roles.exists?(name: "Assessor")
			redirect_to assessor_dashboard_path
		elsif current_user.roles.exists?(name: "Candidate")
			redirect_to candidate_dashboard_path
		else
			test_path
		end	
	end

	def test
	end
end