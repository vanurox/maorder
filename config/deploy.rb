# config valid only for current version of Capistrano
lock "3.8.1"


set :application, "maorder"
set :repo_url, "https://github.com/vanurox/maorder.git"

set :deploy_to, '/home/deploy/maorder'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"


set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp


set :ssh_options, {
  config: false
  #Other options...
}
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
