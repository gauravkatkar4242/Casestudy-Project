require 'rails_helper'

RSpec.describe RoleUser, type: :model do
 
  it { should belong_to(:role) }
  it { should belong_to(:user) }
  
  it {should validate_uniqueness_of(:role).scoped_to(:user_id)}  
end
