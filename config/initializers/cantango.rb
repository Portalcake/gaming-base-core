CanTango.config do |config|
  config.debug.set :off
  config.permits.disable :account, :special, :role_group
  config.engines.all :on
  #config.roles.role_system = :simple_roles
  
  config.ability.mode = :no_cache #"fix" no-key error
  config.engine(:permission).set :off
  config.engine(:cache).set :off

  config.guest.user Proc.new { Guest.new }
end