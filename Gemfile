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
gem 'arel'
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
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development, :test do
  gem 'web-console'
  gem 'spring'
  gem 'bullet'
end

group :production do
  gem 'rails_12factor'
end
