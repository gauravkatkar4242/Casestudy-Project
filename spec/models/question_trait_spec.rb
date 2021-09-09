require 'rails_helper'

RSpec.describe QuestionTrait, type: :model do
  before(:each) do
    @qt = create(:question_trait)
  end
  it { should have_many(:assessor_responses) }
  it { should belong_to(:question) }
  it { should belong_to(:trait) }

  it { should validate_uniqueness_of(:trait).scoped_to(:question_id) }


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

