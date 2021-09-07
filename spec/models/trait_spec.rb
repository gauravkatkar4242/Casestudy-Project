require 'rails_helper'

RSpec.describe Trait, type: :model do
  before(:each) do
    @trait = create(:trait1)
  end
  it "Valid Trait" do
    expect(@trait).to be_valid
  end

  it "Invalid trait - Blank name" do 
    @trait.name = nil
    expect(@trait).not_to be_valid
  end
end
