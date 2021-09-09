require 'rails_helper'

RSpec.describe Casestudy, type: :model do
 
  before do  
    RoleUser.delete_all
    Role.delete_all
    User.delete_all
    Casestudy.delete_all
    @casestudy = create(:casestudy)
  end

  after do
    Casestudy.delete_all
  end

  it { should have_many(:pages)}
  it { should have_many(:questions)}
  it { should have_many(:casestudy_users)}
  it { should have_many(:users).through(:casestudy_users) }
  it { should have_many(:question_traits).through(:questions) }
  it { should belong_to(:creator).class_name('User').with_foreign_key('creator_id') }

  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
 
  it "valid Casestudy" do
    expect(@casestudy).to be_valid
  end

  it "Invalid Casestudy - Blank name" do
    @casestudy.name = nil
    expect(@casestudy).not_to be_valid
  end
  it "Invalid Casestudy - Blank Duration" do
    @casestudy.duration = nil
    expect(@casestudy).not_to be_valid
  end
  it "Invalid Casestudy - Blank Scale" do
    @casestudy.scale = nil
    expect(@casestudy).not_to be_valid
  end
  it "Invalid Casestudy - No Creator id" do
    @casestudy.creator_id = nil
    expect(@casestudy).not_to be_valid
  end


end