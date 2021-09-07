class Ability
  include CanCan::Ability

  def initialize(user)

    if user == nil
      return
    end
    if user.roles.exists?(name: "Admin")
      can :admin, :dashboard
      can :user_permissions, :dashboard
      can :update_role, :dashboard

      can :manage, Page
      can :manage, Question
      can :manage, Casestudy
      can :manage, CasestudyUser
      can :manage, Trait
      can :manage, QuestionTrait


    elsif user.roles.exists?(name: "Content Creator")
      can :content_creator, :dashboard
      can :manage, Casestudy, :creator => user 
      can :read, Casestudy
      can :manage, Question  
      can :manage, Page
      can :manage, CasestudyUser
      can :manage, Trait




    elsif user.roles.exists?(name: "Assessor")
      can :assessor, :dashboard

    elsif user.roles.exists?(name: "Candidate")
      can :candidate, :dashboard
      can :read, Casestudy, users: { id: user.id }
      can :index , UserResponse, :user_id => user.id
      can :exam , UserResponse, :user_id => user.id
      can :update , UserResponse, :user_id => user.id
      can :submit , UserResponse, :user_id => user.id
      can :update_time, UserResponse


    end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
