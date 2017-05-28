source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'capistrano-rails', group: :development
gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
gem 'capistrano-passenger'
gem 'dotenv-rails'
gem 'normalize-rails'
gem 'rspec-rails'

group :development, :test do
  gem 'pry-rails', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'foreman'
  gem 'subcontractor'
  # gem 'opal_hot_reloader', github: 'fkchang/opal-hot-reloader'
end

gem 'hyper-component'
gem 'hyper-operation'
gem 'opal-rails'
gem 'hyper-react'
gem 'hyper-store'
gem 'hyper-trace'
gem 'react-rails'
gem 'opal-browser'
