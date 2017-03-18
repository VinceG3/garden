# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger.info("Using API_URL: #{ENV['API_URL']}")
