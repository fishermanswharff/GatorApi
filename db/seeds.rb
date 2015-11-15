ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
end

users = User.create!([
  {
    first_name: 'Jason',
    last_name: 'Wharff',
    username: 'jasonwharff',
    role: 'admin',
    email: 'fishermanswharff@mac.com',
    password_digest: '$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6',
    token: '7a2ab5a8677b446eb1c269c5056a001d'
  },
  {
    first_name: 'Jenna',
    last_name: 'Wharff',
    username: 'ndpndntjn',
    role: 'generic',
    email: 'jennawharff@me.com',
    password_digest: '$2a$10$oFqbXJQo1Vbwhb4vLLQmbu827Yqooz5QHdW1sy8lwfVk9ksxCLJXO',
    token: 'b4b06767b652419fa4d22fecd74770bc'
  }
])

AuthenticationProvider.create(name: 'twitter')
AuthenticationProvider.create(name: 'instagram')
AuthenticationProvider.create(name: 'linkedin')

=begin

# curl -d "user[first_name]=Foo&user[last_name]=Bar&user[password]=secret&user[password_confirmation]=secret&user[username]=foo&user[email]=foo@bar.com" -X POST localhost:3000/users
# { first_name:"Foo",last_name:"Bar",email:"foo@bar.com",username:"foo",role:"generic",token:"8e961240e4164e008d60bcddc85b2462", password_digest: "$2a$10$q6mH6Ho2NpQMhuFIOIqqBOWzYMS4d69PLuYHdUzXgiemj/L8zZpfa"}

UserAuthentication.create(user_id: 1, authentication_provider_id: 1, uid: '20350433', token: '20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6', params:
   {"provider"=>"twitter",
    "uid"=>"20350433",
    "info"=>
     {"nickname"=>"jasonwharff",
      "name"=>"JasonWharff",
      "location"=>"boston",
      "image"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",
      "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",
      "urls"=>{"Website"=>"http://t.co/8oulbeIXyc", "Twitter"=>"https://twitter.com/jasonwharff"}},
    "credentials"=>{"token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}})



{
  "id":2,
  "first_name":"Jenna",
  "last_name":"Wharff",
  "username":"ndpndntjn",
  "role":"generic",
  "email":"jennawharff@me.com",
  "password_digest":"$2a$10$oFqbXJQo1Vbwhb4vLLQmbu827Yqooz5QHdW1sy8lwfVk9ksxCLJXO",
  "token":"b4b06767b652419fa4d22fecd74770bc",
  "reset_password_token":null,
  "reset_password_sent_at":null,
  "remember_created_at":null,
  "sign_in_count":0,
  "current_sign_in_at":null,
  "last_sign_in_at":null,
  "created_at":"2014-12-02T18:30:16.657Z",
  "updated_at":"2014-12-02T18:30:16.657Z"}
{
  "id":1,
  "first_name":"Jason",
  "last_name":"Wharff",
  "username":"jasonwharff",
  "role":"admin",
  "email":"fishermanswharff@mac.com",
  "password_digest":"$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6",
  "token":"7a2ab5a8677b446eb1c269c5056a001d",
  "reset_password_token":null,
  "reset_password_sent_at":null,
  "remember_created_at":null,
  "sign_in_count":0,
  "current_sign_in_at":null,
  "last_sign_in_at":null,
  "created_at":"2014-12-02T18:08:28.417Z",
  "updated_at":"2014-12-02T18:08:28.417Z"
}

=end

