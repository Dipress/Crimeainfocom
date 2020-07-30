# config valid only for current version of Capistrano
#lock '3.6.0'

set :rvm_type, :system
set :rvm_ruby_version, '2.4.1@crimeainfocom-rails5'
set :rvm_roles, [:app, :web]

set :repo_url, "git@github.com:Dipress/Crimeainfocom.git"

set :branch, 'master'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name

set :rails_env, 'production'
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :conditionally_migrate, true

set :assets_roles, [:app, :web]

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :tmp_dir, "/home/deploy/tmp"

set :default_environment, {
  "RAILS_RELATIVE_URL_ROOT" => "/crimeinfocom"
}

after "deploy", "deploy:cleanup"
after "deploy:assets:precompile", "deploy:symlink_relative_public"
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do

  task :symlink_relative_public, :roles => :app do
    root_url = default_environment["RAILS_RELATIVE_URL_ROOT"]
    if root_url
      root_dir = root_url.split("/")[0..-2].join("/")
      run "mkdir -p #{latest_release}/public#{root_dir}" if root_dir.present?
      run "ln -nfs #{latest_release}/public #{latest_release}/public#{root_url}"
    end
  end

  task :restart do
    invoke 'unicorn:restart'
  end

end
