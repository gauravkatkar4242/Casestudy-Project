class Role < ApplicationRecord
	has_many :role_users
	has_many :users, through: :role_users
	
	validates :name, uniqueness: true, presence: true
end
