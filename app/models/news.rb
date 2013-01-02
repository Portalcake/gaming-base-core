class News < ActiveRecord::Base

  attr_accessible :title, :url, :game_id, :content, :published

  belongs_to :game, :inverse_of => :news
  belongs_to :user, :inverse_of => :news

  before_validation {
    self.published = Time.now if published.blank?
  }

  validates :title, :published, :presence=>true

  default_scope order("news.published DESC")
  scope :published, lambda { where("news.published <= ?", Time.now) }

  self.per_page = 10

  def author
    self.user || self[:author]
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
