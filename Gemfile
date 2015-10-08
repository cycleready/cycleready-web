source 'https://rubygems.org'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'rails', '4.2.1'
gem 'bower-rails', '~> 0.9.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# active admin for web interface
gem 'activeadmin', github: 'activeadmin'
gem 'devise'

# use Friendly ID for more readable routes
gem 'friendly_id', '~> 5.1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rails-erd'
end

group :test do
  gem 'minitest-reporters',   '1.0.5'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
  gem 'guard-minitest',       '2.3.1'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end
