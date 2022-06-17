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
gem 'jb'

# media upload
gem 'carrierwave'
gem 'cloudinary'

# authentication
gem 'devise', '~> 4.8'
gem 'devise_token_auth', git: 'https://github.com/lynndylanhurley/devise_token_auth.git'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-twitter'

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

# admin use
gem 'bootstrap', '~> 4.3.1'
gem 'devise-i18n'
gem 'font-awesome-sass', '~> 5.11.2'
gem 'jquery-rails'
gem 'kaminari'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # code check
  gem 'bullet'
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  # debug
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'pry-rails'

  # test
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
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
