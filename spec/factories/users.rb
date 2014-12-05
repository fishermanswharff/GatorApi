# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  name  :string
#  about :text
#  email :string
#

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name('jasonwharff')
    email Faker::Internet.email('jason')
    
  end
end
