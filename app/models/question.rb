class Question < ApplicationRecord
  belongs_to :casestudy
  has_many :question_traits, :dependent => :destroy
  has_many :traits, through: :question_traits
  has_many :user_responses

  validates :body, presence: true
  
end
