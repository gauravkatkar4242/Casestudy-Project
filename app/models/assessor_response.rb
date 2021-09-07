class AssessorResponse < ApplicationRecord
	belongs_to :question_trait
	belongs_to :casestudy_user
	belongs_to :user
	belongs_to :assessor, class_name: "User"

	validate :check_user_id_and_accessor_id

	def check_user_id_and_accessor_id
	  errors.add(:accessor_id, "Assessor can't be the same as user") if user_id == assessor_id
	end
end
