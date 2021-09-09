require 'rails_helper'

RSpec.describe "UserResponse", type: :request do
  before(:each) {
      RoleUser.delete_all
      User.delete_all
      @candidate = create(:candidate) 
      @casestudy_user = create(:casestudy_user, user: @candidate)
      sign_in @candidate
   }

  describe "GET /index" do
    before(:example) { get casestudy_user_user_responses_path(@casestudy_user) }

    it "is a success" do
     expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
     expect(response).to render_template('index')
    end
  end

  describe "Test UserResponse#exam" do
    before(:example) { get casestudy_user_start_exam_path(@casestudy_user) }
    
    it "is a success" do
     expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
     expect(response).to render_template('exam')
    end
  end
  

  # describe "Test UserResponse#update" do
  #   before(:example) { 
  #     get casestudy_user_start_exam_path(@casestudy_user)
  #   puts @casestudy_user.inspect

  #     patch casestudy_user_user_response_path(@casestudy_user,@casestudy_user.assessor_responses.first) }
    
  #   it "is a success" do
  #    expect(response).to have_http_status(:ok)
  #   end

  #   it "renders 'index' template" do
  #    expect(response).to render_template('exam')
  #   end
  # end

  
end