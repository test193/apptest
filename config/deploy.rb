require "bundler/capistrano"

server "92.51.171.57:2222", :web, :app, :db, primary: true

set :application, "appmanya"
set :user, "rubydeployer"
set :deploy_to, "/usr/local/www/sites/admin.appmanya.com"
set :deploy_via, :copy
set :scm, :git
set :repository,  "git@github.com:apetrov88/AppMania_Server.git"
set :branch, "master"
set :use_sudo, false
set :bundle_gemfile,  "Gemfile"
set :bundle_dir,      File.join(fetch(:shared_path), 'bundle')
set :bundle_flags,    "--deployment --quiet"
set :bundle_without,  [:development, :test]
set :bundle_cmd,      "bundle" 
set :bundle_roles,    {:except => {:no_release => true}} 

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :deploy do
  task :restart, roles: :app do
    bundle exec rake RAILS_ENV=production assets:precompile
    run "touch #{current_path}/tmp/restart.txt"
  end
end