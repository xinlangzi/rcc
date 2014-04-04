require 'capistrano/ext/multistage'
require 'capistrano_colors'
require 'rvm/capistrano'
require 'bundler/capistrano'

set :stages, %w(staging production)
set :default_stage, 'staging'

set :repository, 'git@github.com:xinlangzi/rcc.git'
set :scm, :git
set :scm_verbose, true
set :checkout, 'export'
set :deploy_via, :remote_cache
set :use_sudo, false
set :bundle_flags, '--deployment --quiet --binstubs'
set :bundle_without, [:test, :development]
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# Bonus! Colors are pretty!
def red(str)
  "\e[31m#{str}\e[0m"
end

# Figure out the name of the current local branch
def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
  puts "Deploying branch #{red branch}"
  branch
end

set :branch, current_git_branch

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{latest_release}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end