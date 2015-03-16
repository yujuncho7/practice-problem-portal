source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.16'
gem 'bcrypt', '~> 3.1.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'cucumber-rails', :require => false
  gem 'sqlite3'
  gem 'ruby-debug19'
  gem 'rspec-rails', '~>2.14.0'
  gem 'simplecov'
  gem 'database_cleaner'

  # Debugging Tools recommended by Sam
  # gem 'better_errors'
  # gem 'pry-byebug'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml'

# To use ActiveModel has_secure_password

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
