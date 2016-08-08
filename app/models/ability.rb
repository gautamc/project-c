class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.isAdmin?
      can :manage, :all
    elsif user.isApprovedUser?
      can :read, :all
      can :update, Note, user_id: user.id
    else
      can :read, :all
    end
  end

end
