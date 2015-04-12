class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role=='admin'
      can :manage, :all
    elsif user.role=='moderator'
      can :manage, :all
    elsif user.role=='author'
      can [:index, :show], School
      cannot [:new, :edit, :update, :destroy], School
      can [:index, :show, :create], Review
      cannot [:approve, :edit, :destroy], Review
      cannot [:index, :developerPage], EngineController
      can [:index, :show, :create], Post
      cannot [:edit, :destroy], Post
      cannot [:read, :create, :destroy], Ckeditor
      #cannot [:index, :show, :destroy], User
    else
      can :new, User
      cannot [:index, :developerPage], EngineController
    end
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
