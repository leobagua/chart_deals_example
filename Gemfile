source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions.
gem 'rest-client'

# Use Webpack to manage app-like JavaScript modules in Rails
gem 'webpacker'

# Integrate React.js with Rails views and controllers, the asset pipeline, or webpacker.
gem 'react-rails'

# Library for stubbing and setting expectations on HTTP requests in Ruby.
gem 'webmock'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # RSpec for Rails 5+ http://relishapp.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 4.0'

  # A runtime developer console and IRB alternative with powerful introspection capabilities.
  gem 'pry'

  # Pretty print your Ruby objects with style -- in full color and with proper indentation
  gem 'awesome_print'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
