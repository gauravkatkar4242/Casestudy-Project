require 'rails_helper'

RSpec.describe UserResponse, type: :model do
  before(:each) do
    @ur = create(:user_response)
  end
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
