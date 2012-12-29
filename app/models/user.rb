class User < ActiveRecord::Base
  tango_user
  simple_roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :encryptable, :confirmable, :lockable,
         :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :time_zone

  validates :name,
      :uniqueness => { :case_sensitive => false },
      :length => { :minimum => 3, :maximum => 24 },
      :allow_blank => false,
      :format => { :with => /^[a-z0-9]+(\s[a-z0-9]+)*$/i }

  before_save { self.email = email.downcase }

  def self.guest
    session[:guest_user] ||= Guest.new # create Guest model (usually not to be persisted!)
  end

  def roles_list(dummy=nil)
    [:guest] + self.roles
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
