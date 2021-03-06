source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "cancancan", "~> 2.0"
gem "devise"
gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "config"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "3.1.11"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
gem "jquery-rails"
gem "bootstrap-sass", "3.3.7"
gem "carrierwave"
gem "mini_magick"
gem "bootstrap-datepicker-rails"
gem "factory_girl_rails"
gem "faker", "1.7.3"
group :development, :test do
  gem "mysql2", ">= 0.3.18", "< 0.5"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec-rails", "~> 3.5"
  gem "pry-rails"
end

group :test do
  gem "rspec-activemodel-mocks"
  gem "database_cleaner"
  gem "shoulda-matchers", "3.0.1"
  gem "simplecov", require: false
  gem "rails-controller-testing"
end

group :development do
  gem "mysql2", ">= 0.3.18", "< 0.5"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
