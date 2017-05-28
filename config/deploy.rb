# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "garden"
set :repo_url, "git@github.com:VinceG3/garden.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/garden"
set :bundle_without, [:development, :test]

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, '.env', 'passenger.8080.pid', 'passenger.8080.pid.lock'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart
  
  task :restart do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, 'passenger-config', 'restart-app', '/home/deploy/garden'
      end
    end
  end

  task :start do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :passenger, :start, '--daemonize', '--port', '8080', '-e', 'production'
      end
    end
  end

  task :stop do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :passenger, :stop, '--port', '8080'
      end
    end
  end
end
