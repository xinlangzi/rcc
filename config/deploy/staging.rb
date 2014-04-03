set :rvm_type, :user
set(:port, 30002)
set :application, "rcc.51shepherd.com"
server application, :app, :web, :db, :primary=>true
set(:user, "programmer")
set :deploy_to, "/home/#{user}/public_html/#{application}"
set(:rails_env, "qa")
set :rvm_ruby_string, '1.9.3'

require 'capistrano/gitflow'

