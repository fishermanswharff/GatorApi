FactoryGirl.define do
  sequence(:username) { |n| Faker::Internet.user_name + "-#{n}" }
end
