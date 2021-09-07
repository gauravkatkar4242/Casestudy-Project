class CasestudyUser < ApplicationRecord
  belongs_to :casestudy
  belongs_to :user
  belongs_to :assessor, class_name: "User"
  has_many :user_responses
  has_many :assessor_responses
  validates_uniqueness_of :casestudy, :scope => [:user]



  enum status: [:Not_started, :in_progress, :submitted_but_not_assessed, :submitted_and_assessed]
  validate :check_user_id_and_accessor_id

  def check_user_id_and_accessor_id
    errors.add(:assessor_id, "Assessor can't be the same as user") if user_id == assessor_id
  end

end
