class Trait < ApplicationRecord
	has_many :question_traits
  	has_many :questions, through: :question_traits

  	validates :name, presence: true, uniqueness: true
end
