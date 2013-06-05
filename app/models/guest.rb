class Guest
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :password, :password_confirmation, :remember_me
  def initialize
    self.name = "Guest"
    self.email = "guest@example.com"
  end

  def create(options={})
  end

  def roles_list(dummy=nil)
    [:guest]
  end

  def persisted?
    false
  end
end