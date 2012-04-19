#############################################################
#    RVM Bootstrap Settings
##############################################################
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3-p125@rails32'
set :rvm_type, :system


#############################################################
#    Bundler-Capistrano Bootstrap Settings
##############################################################
require 'bundler/capistrano'


#############################################################
#    Database Bootstrap Settings
##############################################################
# require File.expand_path('../database_deploy.rb', __FILE__)


#############################################################
#    Deployment Settings
#############################################################
set :application, "onkeeband.com"
set :deploy_to, "/var/www/projects/#{application}"
set :keep_releases, 3  ## Limited number of releases stored
set :use_sudo, false
# set :rake, "/usr/local/rvm/gems/ruby-1.9.2-p0\@rails3/bin/rake"
# set :bundle_cmd,  "/usr/local/rvm/gems/ruby-1.9.2-p0\@rails3/bin/bundle"
default_run_options[:pty] = true


#############################################################
#    GIT Version Control
#############################################################
set :scm, :git
set :repository,  "git@github.com:onkeeband/onkeeband-webapp.git"
set :branch, "master"
set :deploy_via, :remote_cache
#set :scm_command, "/opt/local/bin/git"
set :scm_command, "/usr/bin/git"
set :scm_verbose, true
set :local_scm_command, :default


#############################################################
#    SSH
#############################################################
ssh_options[:username] = 'lenny'
ssh_options[:port] = 22
ssh_options[:host_key] = 'ssh-rsa'
ssh_options[:forward_agent] = true
ssh_options[:keys] = %w(/home/lenny/.ssh/authorized_keys)
#ssh_options[:verbose] = :debug


#############################################################
#    Servers
#############################################################
role :web, "onkeeband.com"                    # Your HTTP server, Apache/etc
role :app, "onkeeband.com"                    # This may be the same as your `Web` server
role :db,  "onkeeband.com", :primary => true  # This is where Rails migrations will run
#role :db,  "your slave db-server here"


#############################################################
#    Passenger
#############################################################
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#############################################################
#    Media
#############################################################
namespace :media do
  task :setup, :roles => :app, :except => { :no_release => true }  do
    run "mkdir -p #{shared_path}/media/audio/home-playlist"
    run "mkdir -p #{shared_path}/media/video"
    run "mkdir -p #{shared_path}/docs"
  end
  task :symlink, :roles => :app, :except => { :no_release => true }  do
    run "ln -nfs #{shared_path}/media #{release_path}/public/media"
    run "ln -nfs #{shared_path}/docs #{release_path}/public/docs"
  end
end

after "deploy:setup",           "media:setup"   unless fetch(:skip_db_setup, false)
after "deploy:finalize_update", "media:symlink", "deploy:cleanup"