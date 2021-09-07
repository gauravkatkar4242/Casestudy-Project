require 'rails_helper'

RSpec.describe Question, type: :model do
 
  before do  
    @question = create(:question)
  end

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
