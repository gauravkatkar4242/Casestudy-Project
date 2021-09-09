require 'rails_helper'

RSpec.describe 'WalkInTests', type: :system do

	before do
    	driven_by(:rack_test)
    	@assessor = create(:assessor)
    	@cc = create(:cc)
    	@casestudy = create(:casestudy, creator: @cc)
    	@pages = create_list(:page, 3, casestudy: @casestudy)
    	@ques = create_list(:question, 3, casestudy: @casestudy)

  	end

  	it "New User walked in" do 
  		visit "/"
  		click_on "Walk in Tests"
  		expect(page).to have_content("Enter Details")
  		visit "/walk_in_tests/#{@casestudy.id}/#{@assessor.id}"
  		expect(page).to have_content("Enter Details")
  		fill_in "name", with: "TestUser"
  		fill_in 'email', with: "test@exam.com"
  		fill_in "passkey", with: @casestudy.passkey
  		click_on "Proceed"
  		expect(page).to have_content("Instructions")
  		expect(page).to have_content("You are Logged in as test@exam.com")
  		expect(User.last.name).to eq('TestUser')
  		expect(CasestudyUser.last.casestudy).to eq(@casestudy)
  		expect(CasestudyUser.last.user.email).to eq("test@exam.com")
  		expect(CasestudyUser.last.assessor).to eq(@assessor)
  		expect(CasestudyUser.last.status).to eq("not_started")

  		click_on "start"
  		expect(page).to have_content("Casestudy Details")
  		expect(CasestudyUser.last.started_time).not_to eq(nil)
  		expect(CasestudyUser.last.status).to eq("in_progress")

		# within find('user_response_response') do

		# 	fill_in "user_response_response", with: "Answer 1"
		# 	click_on "Save Answer"
		# end

		within first('#answer') do
			fill_in ("user_response_response"), with: "Answer 1"
			click_on "Save Answer"
		end
		expect(UserResponse.first.response).to eq("Answer 1")

		click_on "Submit Final"
		expect(page).to have_content("Exam Submitted Successfully and Logged out")
		expect(CasestudyUser.last.status).to eq("submitted_but_not_assessed")

  	end
end

# Casestudy id: 1, 
# 	duration: 100, 
# 	scale: 10, 
# 	name: "Casestudy 1", 
# 	creator_id: 9, 
# 	passkey: "qazqaz"