ruby   '2.0.0'
source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'devise'
gem 'cancan'
gem 'role_model'
gem 'thin'
gem "mongoid", "~> 3.0.0"
gem 'haml-rails'
gem 'simple_form'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick'
gem 'inherited_resources'

group :development, :test do
  gem 'letter_opener'  
  gem 'rspec-rails',      '~> 2.0'
  gem 'debugger',         '1.4.0'
end

group :development do
  gem 'letter_opener'
end

group :production do
  gem "fog"
end

group :test do
  gem 'mocha', :require => 'mocha/api'
  gem 'mailcatcher' 
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  # gem 'capybara-webkit'
  gem 'faker'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
