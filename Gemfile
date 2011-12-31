source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'paperclip'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'turn', :require => false # Pretty printed test output  
  gem 'minitest'
  gem 'factory_girl_rails'
  gem 'capybara', '>= 1.1.2'
  gem 'cucumber-rails', '>= 1.2.1'
  gem 'cucumber', '>= 1.1.3'
  gem 'launchy'
  gem 'database_cleaner'
end
