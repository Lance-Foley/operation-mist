# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :read, Job
      can :create, Job
      can :update, Job
      can :destroy, Item do |item|
        item.try(:user) == user
      end
    elsif user.sales?
      can :read, Job
    end
  end
end