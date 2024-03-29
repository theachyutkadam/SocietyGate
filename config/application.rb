# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocietyGate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.active_record.belongs_to_required_by_default = false

    # Rails.logger = Logger.new(STDOUT)
    # Rails.logger.level = Logger::DEBUG
    # config.logger = Logger.new(STDOUT)
    # config.logger = Logger::Logger.new("Application Log")
    # Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    ActiveModel::Serializer.config.adapter = :json
  end
end
