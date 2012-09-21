server "92.51.171.57", :web, :app, :db, primary: true

set :application, "appmanya"
set :user, "rubydeployer"
set :deploy_to, "/usr/local/www/sites/admin.appmanya.com"
set :deploy_via, :remote_cache
set :scm, :git
set :repository,  "git@github.com:apetrov88/AppMania_Server.git"
set :branch, "master"
set :use_sudo, false

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :deploy do
  task :restart, roles: :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
end