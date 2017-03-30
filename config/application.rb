require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module GardenRails
  class Application < Rails::Application
    config.assets.paths << ::Rails.root.join('app', 'models').to_s
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.hyperloop.auto_config = false
  end
end
