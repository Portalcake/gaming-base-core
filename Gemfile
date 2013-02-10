source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'haml'

#user-related gems
gem 'devise', '~> 2.1'
gem 'devise-encryptable'
gem 'devise-i18n'
gem 'cantango'
gem 'simple_roles'

#cronjob management
gem 'whenever', :require => false 

#file attachments
gem 'paperclip', '~> 3.0'
gem 'paperclip-meta', '~> 0.4'

#pagination
gem 'will_paginate', '~> 3.0'

#form-helper
gem 'formtastic', '~> 2.0'

#navigation helper
gem 'simple-navigation', '~> 3.10'

#used for extracting assets (e.g. icons) from game files
gem 'mini_magick', '~> 3.4'

#rss/feed parser
gem 'feedzirra', '~> 0.0'

#markdown requirement
gem 'rdiscount', '~> 1.6'
#bbcode
gem 'bb-ruby', '~> 0.9'

#for mass-import of new records
gem 'activerecord-import', '~> 0.3'

#advanced active record queries
gem 'squeel', '~> 1.0'

gem 'jquery-rails'

#subpages
gem 'forum', :path => "subpages/forum"
#games related subpages
gem 'ragnarok2', :path => "subpages/game-ro2"
gem 'rose', :path => "subpages/game-rose"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  #normalize browser behavior (like reset.css does)
  gem 'normalize-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "rails-i18n-debug"
end
