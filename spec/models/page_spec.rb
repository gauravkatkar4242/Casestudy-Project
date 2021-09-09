require 'rails_helper'

RSpec.describe Page, type: :model do
 
  before do  
    @page = create(:page)
  end
  it { should belong_to(:casestudy) }
  
  it "Valid Page" do
    expect(@page).to be_valid
  end
  it "Invalid Page - Blank body" do
    @page.body = nil
    expect(@page).not_to be_valid 
  end
  it "Invalid Page - Casestudy not exists" do
    @page.casestudy_id = nil
    expect(@page).not_to be_valid  
  end

end
