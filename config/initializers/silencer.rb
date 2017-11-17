require File.dirname(__FILE__) + '/../../lib/custom_logger.rb'
Rails.application.configure do
  config.middleware.swap Rails::Rack::Logger, CustomLogger
end
