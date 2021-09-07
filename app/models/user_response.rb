class UserResponse < ApplicationRecord
	belongs_to :question
	belongs_to :casestudy_user
	belongs_to :user

    validates_uniqueness_of :question, :scope => [:casestudy_user]

	validates :response, presence: true
end
