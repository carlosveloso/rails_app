source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'faker'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-spork'
  gem 'spork-rails', :github => 'sporkrb/spork-rails' 
  gem 'factory_girl_rails', '~> 4.4.1'
end

gem 'sass-rails', '~> 4.0.2'
gem 'sprockets', '2.11.0'
gem 'bootstrap-sass'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bcrypt', '~> 3.1.7'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end