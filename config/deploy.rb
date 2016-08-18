set :rvm_ruby_string, "2.3.0@crimeainfocom-rails5"
require "rvm/capistrano"
require "bundler/capistrano"

set :rvm_type, :system
set :rvm_path, "/usr/local/rvm"

set :application, "crimeainfocom"
set :repository,  "git@github.com:Dipress/Crimeainfocom.git"

set :linked_dirs, fetch(:linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads'])
set :linked_files, fetch(:linked_files, ['config/database.yml', 'config/secrets.yml'])

set :scm, :git
set :user, "root"
set :use_sudo, false

set :branch, "master"
set :deploy_via, :remote_cache
set :keep_releases, 3
set :deploy_to, "/var/www/apps/#{application}"
set :rails_env, "production"
set :domain, "194.54.152.50"
set :scm_command, "/usr/bin/git"
set :scm_verbose, true
set :normalize_asset_timestamps, false

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

role :web, domain
role :app, domain
role :db,  domain, primary: true

ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

namespace :deploy do
  desc 'Unicorn restart'
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{latest_release} && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end

  desc 'Unicorn start'
  task :start do
    run "cd #{latest_release} && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end

  desc 'Unicorn stop'
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

end

after "deploy", "deploy:cleanup", "deploy:restart"