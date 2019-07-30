# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['mail_host']
USER = ENV['mail_user']
PASS = ENV['mail_pass']
DOMAIN = ENV['mail_domain']
MAIL_PORT = ENV['mail_port']
AUTH = ENV['mail_auth']

#HOSTNAME = Rails.application.secrets.mail_host
#USER = Rails.application.secrets.mail_user
#PASS = Rails.application.secrets.mail_pass
#DOMAIN = Rails.application.secrets.mail_domain
#PORT = Rails.application.secrets.mail_port
#AUTH = Rails.application.secrets.mail_auth


module WbooksApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
