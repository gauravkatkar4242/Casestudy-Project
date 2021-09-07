class Casestudy < ApplicationRecord
	has_many :pages
	has_many :questions
	has_many :casestudy_users
	has_many :users, through: :casestudy_users

	belongs_to :creator, class_name: "User", :foreign_key => 'creator_id'

	# accepts_nested_attributes_for :pages
	# accepts_nested_attributes_for :questions
	validates :name, presence: true
	validates :duration, presence: true
	validates :scale, presence: true

end
