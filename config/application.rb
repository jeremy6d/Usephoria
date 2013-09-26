require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
    
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "mongoid/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Usephoria
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/api/*)
    config.paths.add "app/api", :glob => "**/*.rb"
    config.generators do |g|
      g.orm                 :mongoid
      g.template_engine     :erb
      g.test_framework      :rspec, :fixture => true, :views => false
      g.fixture_replacement :fabrication
    end
    config.action_mailer.delivery_method   = :postmark
    config.action_mailer.postmark_settings = { :api_key => ENV['POSTMARK_API_KEY'] }
  end
end
