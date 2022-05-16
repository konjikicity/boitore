source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

# database
gem 'pg', '~> 1.1'

# seed data
gem 'seed-fu'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

# serializer
gem 'jbuilder', '~> 2.7'
gem 'active_model_serializers'

# media upload
gem 'carrierwave'
gem 'cloudinary'

# authentication
gem 'devise', '~> 4.8'
gem 'devise_token_auth', '~> 1.1', '>= 1.1.5'

# .env
gem 'dotenv-rails'

# SEO plugin
gem 'meta-tags'

# cors measures
gem 'rack-cors'

# locales
gem 'rails-i18n'

# js speed-up
gem 'uglifier'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # code check
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'bullet'

  # debug
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  
  #test
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :development do
  # schema confirmation
  gem 'annotate'

  gem 'listen', '~> 3.3'
  gem 'web-console', '>= 4.1.0'
  
  # Manage multiple processes
  gem 'foreman'

  gem 'spring'
end

group :test do
  # user test browser
  gem 'webdrivers'
  gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
