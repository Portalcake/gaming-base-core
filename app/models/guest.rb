class Guest
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :password, :password_confirmation, :remember_me
  def initialize
    # basic config of guest user!
    self.name = "Guest"
    self.email = "guest@example.com"
  end

  def create options = {}
    # new instance and set valid attributes?
  end

  def has_role? role
    role.to_sym == :guest
  end

  def persisted?
    false
  end
end