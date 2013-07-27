ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "email_spec"
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Capybara.register_driver :webkit_log_to_file do |app|
  Capybara::Driver::Webkit.new(app, :stdout => File.open(Rails.root.join("log/capybara.log"), "a"))
end

Capybara.javascript_driver = :webkit_log_to_file
Capybara.server_port = 7171
Capybara.always_include_port = true 

RSpec.configure do |config|
  config.mock_with :mocha
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  # config.include Devise::TestHelpers, :type => :controller
  config.include Rails.application.routes.url_helpers, :type => :request
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    Mongoid::IdentityMap.clear

    if [:request, :feature].include? example.metadata[:type]
      Capybara.current_driver = :webkit
    else
      Capybara.use_default_driver
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end