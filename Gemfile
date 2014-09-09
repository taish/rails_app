source 'https://rubygems.org'

gem 'rails', '~> 4.1.4'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

gem 'mysql2'
gem 'bootstrap-sass-rails'
gem 'font-awesome-sass-rails'
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'
gem 'execjs'
gem 'therubyracer'

# for json
gem 'jbuilder', '~> 1.2'
gem 'oj', '~> 2.9.8'
# for other service api
gem 'omniauth-twitter', '~> 1.0.1'
gem 'twitter', '~> 5.11.0'
# for Authentication
gem 'sorcery', '~> 0.8.6'
# for api
gem 'doorkeeper', '~> 1.3.0'
# for error notification
gem 'exception_notification', '~> 4.0.1'
# for batch
gem 'whenever', :require => false
# gem "resque", "~> 2.0.0.pre.1", github: "resque/resque"

# Use Capistrano for deployment
group :deployment do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', '~> 2.0.2'
  gem 'capistrano3-unicorn'
end

# for doc
gem 'sdoc',          group: :doc, require: false

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0.1'
  gem 'guard-rspec'
  gem 'factory_girl_rails', '~> 4.4.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/jonleighton/spring
  gem 'spring'
  gem 'ffaker'
  # debug
  gem 'pry', '0.9.10'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-remote'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'http-dump'
end

group :production do
  gem 'rb-readline'
end
