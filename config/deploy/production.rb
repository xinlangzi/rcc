set(:port, 30002)
set :application, "www.rccxm.com"
server application, :app, :web, :db, :primary=>true
set(:user, "shepherd")
set :deploy_to, "/home/#{user}/public_html/#{application}"
set(:rails_env, "production")
set :rvm_ruby_string, '1.9.3-p194'
