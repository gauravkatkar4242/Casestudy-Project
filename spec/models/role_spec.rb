require 'rails_helper'

RSpec.describe Role, type: :model do

	it { should have_many(:role_users) }
  	it { should have_many(:users).through(:role_users) }
  	it { should validate_uniqueness_of(:name) }

end
