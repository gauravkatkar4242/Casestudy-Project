require 'rails_helper'

RSpec.describe Trait, type: :model do
  before(:each) do
    @trait = create(:trait1)
  end

  it { should have_many(:question_traits) }
  it { should have_many(:questions).through(:question_traits) }
  it { should validate_uniqueness_of(:name) }

  it "Valid Trait" do
    expect(@trait).to be_valid
  end

  it "Invalid trait - Blank name" do 
    @trait.name = nil
    expect(@trait).not_to be_valid
  end
end
