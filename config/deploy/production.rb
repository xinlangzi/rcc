set(:port, 30000)
set :application, "115.28.244.240"
server application, :app, :web, :db, :primary=>true
set(:user, "shepherd")
set :deploy_to, "/home/#{user}/public_html/www.rccxm.com"
set(:rails_env, "production")
set :rvm_ruby_string, '1.9.3-545'
