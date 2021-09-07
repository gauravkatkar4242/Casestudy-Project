require 'rails_helper'

RSpec.describe 'ContentCreatorActivities', type: :system do

	before do
    	driven_by(:rack_test)
  		RoleUser.delete_all
  		Role.delete_all
    	User.delete_all
    	role = create(:candidate_role)
    	@user = create(:candidate)
  	end

  	describe "Sign Up" do
  		it "Account Created Successfully" do
  			visit '/'
  			click_on "Sign up"
  			expect(page).to have_content("Password (6 characters minimum)")
			
  			fill_in "Name", with: "Gaurav"
  			fill_in "Email", with: "gaurav@gmail.com"
  			fill_in "Password", with: "Gaurav"
  			fill_in "Password confirmation", with: "Gaurav"
  			click_on "Sign up"
  			expect(page).to have_content("Logged in as gaurav@gmail.com")
  			expect(User.last.email).to eq("gaurav@gmail.com")
    		expect(RoleUser.last.user.name).to eq("Gaurav")
  		end
  	end

  	describe "Sign In" do
  		it "Logged in Successfully" do
  			visit "/"
  			fill_in "Email", with: @user.email
  			fill_in "Password", with: @user.password
  			click_on "Log in"
  			expect(page).to have_content("You are Logged in as #{@user.email}")
  		end
  	end
end