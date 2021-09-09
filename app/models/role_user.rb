class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user

  validates_uniqueness_of :role, :scope => [:user_id]
end
