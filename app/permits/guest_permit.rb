class GuestPermit < CanTango::UserPermit
  def initialize ability
    super
  end

  protected

  def permit_rules
    can :show, News do |news|
      news.published?
    end
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
