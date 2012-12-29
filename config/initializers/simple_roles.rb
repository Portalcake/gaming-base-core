SimpleRoles.configure do |config|
  config.valid_roles = [:admin]
  config.strategy = :many # Default is :one
end