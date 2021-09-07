require 'rails_helper'

RSpec.describe AssessorResponse, type: :model do
  before(:each) do
    RoleUser.delete_all
    User.delete_all
    @ar = create(:assessor_response)
  end

  it "Valid assessor_response" do
    expect(@ar).to be_valid
  end

  it "Invalid AssessorResponse - Blank casestudy_user" do
    @ar.casestudy_user = nil
    expect(@ar).not_to be_valid
  end
  it "Invalid AssessorResponse - Blank QuestionTrait" do
    @ar.question_trait = nil
    expect(@ar).not_to be_valid
  end
  it "Invalid AssessorResponse - Blank user" do
    @ar.user = nil
    expect(@ar).not_to be_valid
  end
  it "Invalid AssessorResponse - Blank assessor" do
    @ar.assessor = nil
    expect(@ar).not_to be_valid
  end
  # it "Invalid AssessorResponse - Blank " do
  #   @ar.casestudy_user = nil
  #   expect(@ar).not_to be_valid
  # end
end