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
    email 'fishermanswharff@mac.com'
    password "yfgjik0hgzdqs0"
    password_confirmation "yfgjik0hgzdqs0"
    role 'generic'
    first_name 'Jason'
    last_name 'Wharff'
  end
end
