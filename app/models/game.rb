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

  has_many :news_feeds, :dependent=>:destroy
  has_many :news, :dependent=>:destroy

  def to_s
    self.name
  end
end
