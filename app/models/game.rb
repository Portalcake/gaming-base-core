class Game < ActiveRecord::Base
  attr_accessible :token, :name

  validates :token,
      :uniqueness => { :case_sensitive => false },
      :presence => true,
      :allow_blank => false

  validates :name,
      :presence => true,
      :allow_blank => false

  before_validation { self.token = token.downcase }

  def maintenance?
    self.maintenance
  end

  def published?
    self.published
  end
end
