FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { FactoryGirl.generate(:username) }
    role { 'generic' }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'

    trait :admin do
      role 'admin'
    end
  end
end
