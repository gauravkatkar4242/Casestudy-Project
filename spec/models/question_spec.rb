require 'rails_helper'

RSpec.describe Question, type: :model do
 
  before do  
    @question = create(:question)
  end

  it { should have_many(:traits).through(:question_traits) }
  it { should have_many(:user_responses)}
  it { should have_many(:question_traits).dependent(:destroy) }
  it { should belong_to(:casestudy) }



  it "Valid question" do
    expect(@question).to be_valid
  end
  it "Invalid question - Blank body" do
    @question.body = nil
    expect(@question).not_to be_valid 
  end
  it "Invalid question - Casestudy not exists" do
    @question.casestudy_id = nil
    expect(@question).not_to be_valid  
  end
  
end
