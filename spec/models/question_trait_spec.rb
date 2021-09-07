require 'rails_helper'

RSpec.describe QuestionTrait, type: :model do
  before(:each) do
    @qt = create(:question_trait)
  end

  it "Valid QuestionTrait" do
  	expect(@qt).to be_valid
  end
  it "Invalid QuestionTrait - Blank question" do
  	@qt.question = nil
  	expect(@qt).not_to be_valid
  end
  it "Invalid QuestionTrait - Blank Trait" do
  	@qt.trait = nil
  	expect(@qt).not_to be_valid
  end
end

