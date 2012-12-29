class Language < ActiveRecord::Base
  attr_accessible :name, :tld

  validates :tld,
      :uniqueness => { :case_sensitive => false },
      :length => { :is => 2 },
      :allow_blank => false
      
  def to_s
    self.name
  end
end
