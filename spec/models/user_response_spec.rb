require 'rails_helper'

RSpec.describe UserResponse, type: :model do
  before(:each) do
    @ur = create(:user_response)
  end


  it { should belong_to(:question) }
  it { should belong_to(:casestudy_user) }
  it { should belong_to(:user) }
 

  it { should validate_uniqueness_of(:question).scoped_to(:casestudy_user_id).ignoring_case_sensitivity }

  it "Valid user_response" do
    expect(@ur).to be_valid
  end
  it "Invalid user_response - blank Casestudy_User" do
    @ur.casestudy_user = nil
    expect(@ur).not_to be_valid
  end
  it "Invalid user_response - blank Question" do
    @ur.question = nil
    expect(@ur).not_to be_valid
  end
  it "Invalid user_response - blank User" do
    @ur.user = nil
    expect(@ur).not_to be_valid
  end
  it "Invalid user_response - blank Response" do
    @ur.response = nil
    expect(@ur).not_to be_valid
  end
end
