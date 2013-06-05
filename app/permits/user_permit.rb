class UserPermit < CanTango::UserPermit
  def initialize ability
    super
  end

  protected

  def permit_rules
    can :update, Forum::Topic do |t|
      t.user == user
    end
    can :update, Forum::Post do |t|
      t.user == user
    end
    can :create, [Forum::Topic, Forum::Post]

    can [:create, :vote], Ragnarok2::CitizenDrop
  end

  module Cached
    def permit_rules
    end
  end

  module NonCached
    def permit_rules
    end
  end
end
