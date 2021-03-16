source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1", ">= 6.1.3"
# Use Puma as the app server
gem "puma", "~> 5.2", ">= 5.2.2"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.2", ">= 5.2.1"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5.2", ">= 5.2.1"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11", ">= 2.11.2"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.2', '>= 4.2.5'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# Use Active Storage variant
# gem 'image_processing', '~> 1.12', '>= 1.12.1'

# Extra gems for production
gem "devise", "~> 4.7", ">= 4.7.3"
gem "devise-i18n", "~> 1.9", ">= 1.9.2"
gem "mina", "~> 1.2", ">= 1.2.3"
gem "mina-ng-puma", git: "https://github.com/NoTengoBattery/mina-ng-puma.git"
gem "http-accept", "~> 2.1", ">= 2.1.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.7", ">= 1.7.2", require: false

group :production do
  # Use postgresql for the production database
  gem "pg", "~> 1.2", ">= 1.2.3"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Add the SQLite3 database for development and test
  gem "sqlite3", "~> 1.4", ">= 1.4.2"
  # Rubocop linter gems for testing all aspects of the template
  gem "rubocop-rails_config", "~> 1.3", ">= 1.3.3"
  gem "rubocop-rspec", "~> 2.2"
  gem "rubocop-faker", "~> 1.1"
  gem "rubocop-i18n", "~> 3.0"
  gem "rubocop-rake", "~> 0.5.1"
  # Add this to both development and test to make the generators work
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  gem "factory_bot_rails", "~> 6.1"
  gem "faker", "~> 2.16"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", "~> 4.1"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.4", ">= 3.4.1"
  gem "rack-mini-profiler", "~> 2.3", ">= 2.3.1"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "database_cleaner", "~> 2.0", ">= 2.0.1"
  gem "selenium-webdriver"
  gem "webdrivers"
  # Gems to support testing better
  gem "rexml", "~> 3.2", ">= 3.2.4"
  gem "shoulda-matchers", "~> 4.5", ">= 4.5.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
