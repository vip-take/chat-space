require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.helper  false
      g.javascripts false
      g.stylesheets false
      g.test_framework false
    end
  end
end

Rails.application.configure do
  config.i18n.default_locale = :ja
  config.time_zone = 'Tokyo'
  config.active_record.default_timezone = :local
end

