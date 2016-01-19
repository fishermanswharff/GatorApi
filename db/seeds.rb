require 'pry-byebug'
jason = User.find_or_create_by(username: 'jasonwharff')
jason.update_attributes(
  first_name: 'Jason',
  last_name: 'Wharff',
  role: 'admin',
  email: 'fishermanswharff@mac.com',
  password: 'secret',
  password_confirmation: 'secret',
  token: '7a2ab5a8677b446eb1c269c5056a001d'
)
jason.save!

jenna = User.find_or_create_by(username: 'ndpndntjn')
jenna.update_attributes(
  first_name: 'Jenna',
  last_name: 'Wharff',
  role: 'generic',
  email: 'jennawharff@me.com',
  password: 'secret',
  password_confirmation: 'secret',
  token: 'b4b06767b652419fa4d22fecd74770bc'
)
jenna.save!

AuthenticationProvider.find_or_create_by!(name: 'twitter')
AuthenticationProvider.find_or_create_by!(name: 'instagram')
AuthenticationProvider.find_or_create_by!(name: 'linkedin')

Feed.find_or_create_by(url: 'http://rss.cnn.com/rss/cnn_topstories.rss')
Feed.find_or_create_by(url: '')
