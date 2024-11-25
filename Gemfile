source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Core Rails Components
gem "rails", "~> 7.0.8", ">= 7.0.8.6"
gem "sprockets-rails" # Asset pipeline for Rails
gem "pg", "~> 1.1" # PostgreSQL
gem "puma", "~> 5.0" # Web server
gem "jbuilder" # JSON APIs

# JavaScript and Styling
gem "importmap-rails" # Importmap for JavaScript
gem "stimulus-rails" # JavaScript framework
gem "turbo-rails" # Turbo Drive for Rails
gem "tailwindcss-rails" # Tailwind CSS for Rails


# Authentication and Authorization
gem "devise", "~> 4.9.2" # User authentication
gem "pundit", "~> 2.2" # Authorization

# Development and Test Utilities
group :development, :test do
  gem "rspec-rails", "~> 5.1" # BDD testing
  gem "factory_bot_rails", "~> 6.2" # Test data creation
  gem "capybara", "~> 3.38" # Integration testing
end

group :development do
  gem "web-console", "~> 4.1" # Console on exception pages
end

# Additional Gems
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Timezone support for Windows
gem "bootsnap", "~> 1.15", require: false # Speeds up boot times
