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