# source 'http://rubygems.org'
source 'http://ruby.taobao.org/'

# gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# USER GEMS ================================================================
# user's gem put in here
gem 'pg'
gem 'foreigner'
gem 'jquery-rails'
gem 'unicorn'

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano-gitflow'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
  gem 'pry-rails'
end

# END USER GEMS ============================================================

# REFINERY CMS ================================================================
# Anything you put in here will be overridden when the app gets updated.

gem 'refinerycms',              '~> 1.0.8'

group :development, :test do
  # To use refinerycms-testing, uncomment it (if it's commented out) and run 'bundle install'
  # Then, run 'rails generate refinerycms_testing' which will copy its support files.
  # Finally, run 'rake' to run the tests.
  gem 'refinerycms-testing',    '~> 1.0.8'
end

# END REFINERY CMS ============================================================

# USER DEFINED


# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-inquiries',    '~> 1.0'
# gem "refinerycms-news",         '~> 1.2'
# gem 'refinerycms-blog',         '~> 1.6'
# gem 'refinerycms-page-images',  '~> 1.0'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 1.0.0'

# END USER DEFINED

gem 'refinerycms-jobs', '1.0', :path => 'vendor/engines'
gem 'refinerycms-articles', '1.0', :path => 'vendor/engines'
gem 'refinerycms-articles', '1.0', :path => 'vendor/engines'
gem 'refinerycms-ads', '1.0', :path => 'vendor/engines'
