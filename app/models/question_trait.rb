class QuestionTrait < ApplicationRecord
  belongs_to :trait
  belongs_to :question
  has_many :assessor_responses

  validates_uniqueness_of :trait, :scope => [:question]

end
