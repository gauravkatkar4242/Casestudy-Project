require 'rails_helper'

RSpec.describe 'ContentCreatorActivities', type: :system do

	before do
    	driven_by(:rack_test)
    	@cc = create(:cc)
    	sign_in @cc
  	end

  	it "Logged in Successfully" do
  		visit "/"
  		expect(page).to have_content("This is Content Creator Dashboard")
  	end

  	it "Casestudy Created Successfully" do 
  		visit "/"

  		click_on "Casestudies"

  		click_on "Create new Casestudy"

  		expect(page).to have_content("new.html.erb\ncasestudy#new")
  		fill_in "Name", with: "Casestudy 1"
		fill_in "Duration", with: "100"
		fill_in "Scale", with: "10"
		fill_in "casestudy_passkey", with: "qazqaz"
		click_on "Create Casestudy"
		expect(page).to have_content("Casestudy was successfully created.")
		expect(Casestudy.last.name).to eq("Casestudy 1")

		# ----------Add Pages-----------
		within find('#new_page') do
			fill_in "page_body", with: "Page 1"
			click_on "Create Page"
		end
		expect(page).to have_content("Page added successfully")
		expect(Page.last.body).to eq("Page 1")

		within find('#new_page') do
		  fill_in "page_body", with: "Page 2"
			click_on "Create Page"
		end		
		expect(page).to have_content("Page added successfully")
		expect(Page.last.body).to eq("Page 2")

		within find('#new_page') do
		  fill_in "page_body", with: "Page 3"
			click_on "Create Page"
		end
		expect(page).to have_content("Page added successfully")
		expect(Page.last.body).to eq("Page 3")

		#------------Add Questions----------
		within find('#new_question') do
			fill_in "question_body", with: "Question 1"
			click_on "Create Question"
		end
		expect(page).to have_content("Question added successfully")
		expect(Question.last.body).to eq("Question 1")

		within find('#new_question') do
			fill_in "question_body", with: "Question 2"
			click_on "Create Question"
		end
		expect(page).to have_content("Question added successfully")
		expect(Question.last.body).to eq("Question 2")
		
		within find('#new_question') do
			fill_in "question_body", with: "Question 3"
			click_on "Create Question"
		end
		expect(page).to have_content("Question added successfully")
		expect(Question.last.body).to eq("Question 3")

		#---------------Add Trait to Question---------------
		# t1 = create(:trait1)
		# puts page.html
		# within first('#new_trait') do
		# 	select t1.id, from: "#trait_id"

		# end
   	end
	




end
