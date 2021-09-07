class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :role_users, :dependent => :delete_all
	has_many :roles, through: :role_users
	has_many :casestudy_users,:dependent => :delete_all
  has_many :casestudies_created, class_name:'Casestudy', :foreign_key => 'creator_id'
	has_many :casestudies, through: :casestudy_users
	has_many :user_responses, :dependent => :delete_all


	validates :name, presence: true, length: { minimum: 3}, 
									  format: { with: /\A[a-zA-Z\s]+\z/,message: "only allows letters" }

	validates :email, presence: true, format: Devise.email_regexp

  after_create :add_new_role

  private
    def add_new_role
        role_user = RoleUser.new(role_id: Role.find_by(name: "Candidate").id, user_id: self.id)
        role_user.save
    end

end
