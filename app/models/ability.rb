class Ability
  include CanCan::Ability
  include SessionsHelper

  def initialize user
    user ||= User.new
    if user.suppervisor?
        can :manage, :all
    else
        can :read, :all
        can :update, User, id: user.id
    end
  end
end
