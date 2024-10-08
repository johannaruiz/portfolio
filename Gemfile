# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use postgres as the database for Active Record
gem 'pg'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.1.2'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Use Bootstrap
gem 'bootstrap'
# Use Sass to process CSS
gem 'sassc-rails'
# Use Slim for markup
gem 'slim-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use kaminari for easy pagination of blog posts
gem 'kaminari'

# Use recaptcha for bot BS
gem 'recaptcha', require: 'recaptcha/rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'active_record_query_trace'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'rubocop', '~> 1.0'
  gem 'rubocop-capybara', '~> 2.21'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', '~> 2.26'
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', '~> 2.30'
  gem 'rubocop-slim', '~> 0.2.2'
  gem 'web-console'
  # gem 'rubocop-rspec', '~> 3.0', '>= 3.0.4'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec', '~> 3.4'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'simplecov',          require: false
  gem 'simplecov-html',     require: false
  gem 'simplecov-rcov',     require: false
end
