source 'https://rubygems.org'
ruby "2.2.0"
gem 'rails', '4.2.4'
gem 'rails-api'
gem 'unicorn'
gem 'pg'
gem 'rack-ssl-enforcer'
gem 'rack-cors'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'feedjira'
gem 'twitter'
# gem 'linkedin'
# gem 'instagram'
gem 'bcrypt'
gem 'arel' #, '6.0.0.beta2'
gem 'redis-rails'
gem 'redis-rack-cache'
gem 'newrelic_rpm'
gem 'rack-cache'

group :development do
  gem 'annotate'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
end

group :development, :test do
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'spring'
  gem 'bullet'
  gem 'rspec-rails', '~> 3.0.0'
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'rails_12factor'
end
