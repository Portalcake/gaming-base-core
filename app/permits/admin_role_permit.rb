class AdminRolePermit < CanTango::RolePermit
  def initialize ability
    super
  end

  protected

  def permit_rules
    can :manage, :all
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
