require "whenever/capistrano" #rebuild whenever cronjob on deploy
require 'bundler/capistrano' #use bundler
require 'rvm/capistrano' #use bundler

set :application, "gaming-base"
set :repository,  "file:///home/gaming-base-dev/public_html/git/gaming-base.git"
set :scm, :git
set :deploy_to, "/home/gaming-base/rails/#{application}"
set :use_sudo, false
set :branch, 'master'
set :scm_verbose, true
set :rvm_type, :system

set :available_subpages, [
  ["game-rose", "ragnarok2"],
  #["game-ro2", "rose"]
]
set :subpages_base_repository, "file:///home/gaming-base-dev/public_html/git/%subpage_token%.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

server "gaming-base.net", :app, :web, :db, :primary => true, :port => 42, :user => "gaming-base"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :db do
  desc "Touch database configuration file. Be sure to take a look at it!"
  task :setup, :except => { :no_release => true } do
    run "mkdir -p #{shared_path}/config"
    run "touch #{shared_path}/config/database.yml"
  end
  
  desc "Generate symlink for database configuration file" 
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end
end

namespace :gameclients do
  desc "Create gameclients folder."
  task :setup, :except => { :no_release => true } do
    run "mkdir -p #{shared_path}/gameclients/ro2"
    run "mkdir -p #{shared_path}/gameclients/rose"
  end
  desc "Generate symlink for gameclients" 
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/gameclients #{release_path}/share/gameclients" 
  end
end

namespace :subpages do
  desc "Creates folders for subpages and pulls their git master repository"
  task :setup, :except => { :no_release => true } do
    available_subpages.each do |subpage_token, enginge_name|
      run "mkdir -p #{release_path}/subpages/#{subpage_token}"
      run "cd #{release_path}/subpages/#{subpage_token} && git clone #{subpages_base_repository.gsub("%subpage_token%", subpage_token.to_s)}"
      run "cd #{release_path} && /usr/bin/env rake `#{enginge_name}:install:migrations` RAILS_ENV=production"
    end
  end
end

after "deploy:setup", "db:setup"
after "deploy:setup", "gameclients:setup"
after "deploy:finalize_update", "db:symlink"
after "deploy:finalize_update", "gameclients:symlink"
after "deploy:finalize_update", "subpages:setup"
after "deploy", "deploy:migrate"