class GuestPermit < CanTango::UserPermit
  def initialize ability
    super
  end

  protected

  def permit_rules
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
