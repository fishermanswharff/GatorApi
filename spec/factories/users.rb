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
    first_name 'Jason'
    last_name 'Wharff'
    username 'jasonwharff'
    email 'fishermanswharff@mac.com'
    role 'admin'
    password_digest '$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6'
  end
end
