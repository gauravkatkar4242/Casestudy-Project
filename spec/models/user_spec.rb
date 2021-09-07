require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    
    @user = create(:candidate)
  end

  after(:each) do
    RoleUser.delete_all
    Role.delete_all
    User.delete_all
  end
 
  describe 'Check Name' do
    it "Valid Name" do 
      expect(@user).to be_valid
    end
    it "Invalid Name - Less than 3 letters" do
      @user.name = "he"
      expect(@user).to_not be_valid
    end
    it "Invalid Name - nil name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it "Invalid Name - Contains numbers" do
      @user.name = "he11"
      expect(@user).to_not be_valid
    end
    
  end

  describe "Check Email" do
    it "Valid Mail" do
      expect(@user).to be_valid
    end
    it "Invalid Mail - Email Blank" do
      @user.email = nil
      expect(@user).not_to be_valid
    end
    it "Invalid Mail - No @" do
      @user.email = "abcdef"
      expect(@user).not_to be_valid
    end

    it "Invalid Mail - Multiple @" do
      @user.email = "abcd@ef@,gmail.com"
      expect(@user).not_to be_valid
    end

    it "Invalid Mail - Not unique" do
      user2 = create(:candidate)
      user2.email = @user.email
      expect(user2).not_to be_valid
    end
  end
end
