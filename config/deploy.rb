require 'capistrano/ext/multistage'
require 'capistrano/gitflow'
require 'capistrano_colors'

# Add RVM's lib directory to the load path.
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'bundler/capistrano'
require 'rvm/capistrano'

set :stages, %w(staging production)
set :default_stage, 'staging'

set :repository, 'ssh://gitolite@51shepherd.com:30000/rcc'
set :scm, :git
set :scm_verbose, true
set :checkout, 'export'
set :deploy_via, :remote_cache

set :use_sudo, false

set :bundle_flags, '--deployment --quiet --binstubs'
set :bundle_without, [:test, :development]

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

after 'deploy:update_code', 'deploy:symlink_sockets'

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn_rails -c config/unicorn.rb -E #{rails_env} -D"
  end

  task :stop,  :roles => :app do
    run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end

  task :restart, :roles => :app do
    run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
  end

  task :symlink_sockets, :roles => :app do
    run "mkdir -p #{shared_path}/sockets"
    run "rm -rf #{latest_release}/tmp/sockets"
    run "ln -nfs #{shared_path}/sockets #{latest_release}/tmp/sockets"
  end
end

