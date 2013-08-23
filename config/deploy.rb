require "whenever/capistrano" #rebuild whenever cronjob on deploy
require 'bundler/capistrano' #use bundler
require 'rvm/capistrano' #use bundler

set :application, "gaming-base"
set :repository,  "file:///home/gaming-base-dev/public_html/git/gaming-base.git"
set :local_repository,  "http://git.gaming-base.net/gaming-base.git"
set :scm, :git
set :deploy_to, "/home/gaming-base/rails/#{application}"
set :use_sudo, false
set :branch, 'master'
set :scm_verbose, true
set :rvm_type, :system
set :rvm_path, "/usr/local/rvm"

set :available_subpages, [
  {
    :token => "game-ro2",
    :engine => "ragnarok2",
    :active => true
  },
  {
    :token => "game-rose",
    :engine => "rose",
    :active => true
  },
  {
    :token => "forum",
    :engine => "forum",
    :active => true
  }
]
set :subpages_base_repository, "file:///home/gaming-base-dev/public_html/git/%subpage_token%.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

server "gaming-base.net", :app, :web, :db, :primary => true, :port => 42, :user => "gaming-base"

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
    run "ln -nfs #{shared_path}/gameclients/* #{release_path}/share/gameclients" 
  end
end

namespace :games do
  desc "Generate public game data folder"
  task :setup, :except => { :no_release => true } do
    run "mkdir -p #{shared_path}/public/games"
  end
  desc "Generate symlink for public game data folder" 
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/public/games #{release_path}/public/games" 
  end
end

namespace :subpages do
  desc "Creates folders for subpages and pulls their git master repository"
  task :setup, :except => { :no_release => true } do
    available_subpages.each do |subopts|
      run "mkdir -p #{release_path}/subpages/#{subopts[:token]}"
      run "cd #{release_path}/subpages/#{subopts[:token]} && git clone #{subpages_base_repository.gsub("%subpage_token%", subopts[:token])} ." if subopts[:active]
    end
  end
end

namespace :dotenv do
  desc "Touch .env configuration file. Be sure to take a look at it!"
  task :setup, :except => { :no_release => true } do
    run "touch #{shared_path}/.env"
  end
  
  desc "Generate symlink for database configuration file" 
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/.env #{release_path}/.env" 
  end
end

after "deploy:setup", "db:setup"
after "deploy:setup", "gameclients:setup"
after "deploy:setup", "games:setup"
after "deploy:setup", "dotenv:setup"
after "deploy:finalize_update", "dotenv:symlink"
after "deploy:finalize_update", "db:symlink"
after "whenever:update_crontab", "gameclients:symlink"
after "whenever:update_crontab", "subpages:setup"
after "deploy:finalize_update", "games:symlink"
after "deploy", "deploy:migrate"

after "deploy:restart", "deploy:cleanup"