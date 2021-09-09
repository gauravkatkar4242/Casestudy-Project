require 'rails_helper'

RSpec.describe CasestudyUser, type: :model do
 
  before do 
    RoleUser.delete_all
    Role.delete_all
    User.delete_all
    Casestudy.delete_all
    CasestudyUser.delete_all
    @casestudy_user = create(:casestudy_user)
  end

  it { should belong_to(:casestudy) }
  it { should belong_to(:user) }
  it { should belong_to(:assessor).class_name('User') }
  it { should have_many(:assessor_responses) }
  it { should have_many(:user_responses) }
  it { should allow_value('not_started','in_progress','submitted_but_not_assessed','submitted_and_assessed').for(:status) }

  it{ should validate_uniqueness_of(:casestudy).scoped_to(:user_id).ignoring_case_sensitivity } 

  it "Valid casestudy_user" do
    expect(@casestudy_user).to be_valid
  end
  it "Invalid casestudy_user - No Casestudy" do
    @casestudy_user.casestudy_id = nil
    expect(@casestudy_user).not_to be_valid
  end
  it "Invalid casestudy_user - No User" do
    @casestudy_user.user_id = nil
    expect(@casestudy_user).not_to be_valid
  end
  it "Invalid casestudy_user - No Assessor" do
    @casestudy_user.assessor = nil
    expect(@casestudy_user).not_to be_valid
  end

  describe "Validate Function check_user_id_and_accessor_id()" do

    it "Valid Function" do
      expect(@casestudy_user.check_user_id_and_accessor_id()).to be_nil  
    end

    it "Invalid Function" do
      @casestudy_user.user = @casestudy_user.assessor
      @casestudy_user.check_user_id_and_accessor_id()
      expect(@casestudy_user.errors[:assessor_id]).to include("Assessor can't be the same as user")     
   
    end
  end



end