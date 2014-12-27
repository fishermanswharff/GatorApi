Last login: Sun Dec  7 10:04:02 on tty??
jason@The-Silverback-Bulldog: ~ $ cd Documents/WebDevImmersive/Projects/Gator2/gatorApi/
jason@The-Silverback-Bulldog: gatorApi $ rails s
=> Booting WEBrick
=> Rails 4.2.0.beta2 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2014-12-07 11:02:02] INFO  WEBrick 1.3.1
[2014-12-07 11:02:02] INFO  ruby 2.1.2 (2014-05-08) [x86_64-darwin13.0]
[2014-12-07 11:02:02] INFO  WEBrick::HTTPServer#start: pid=4142 port=3000
^C[2014-12-07 11:24:26] INFO  going to shutdown ...
[2014-12-07 11:24:26] INFO  WEBrick::HTTPServer#start done.
Exiting
jason@The-Silverback-Bulldog: gatorApi $ curl -I https://localhost:3001
curl: (7) Failed to connect to localhost port 3001: Connection refused
jason@The-Silverback-Bulldog: gatorApi $ curl -I https://localhost:3001/users
curl: (7) Failed to connect to localhost port 3001: Connection refused
jason@The-Silverback-Bulldog: gatorApi $ curl -I https://0.0.0.0:3001/users
curl: (60) SSL certificate problem: Invalid certificate chain
More details here: http://curl.haxx.se/docs/sslcerts.html

curl performs SSL certificate verification by default, using a "bundle"
 of Certificate Authority (CA) public keys (CA certs). If the default
 bundle file isn't adequate, you can specify an alternate file
 using the --cacert option.
If this HTTPS server uses a certificate signed by a CA represented in
 the bundle, the certificate verification probably failed due to a
 problem with the certificate (it might be expired, or the name might
 not match the domain name in the URL).
If you'd like to turn off curl's verification of the certificate, use
 the -k (or --insecure) option.
jason@The-Silverback-Bulldog: gatorApi $ curl -I https://0.0.0.0:3001/users
curl: (60) SSL certificate problem: Invalid certificate chain
More details here: http://curl.haxx.se/docs/sslcerts.html

curl performs SSL certificate verification by default, using a "bundle"
 of Certificate Authority (CA) public keys (CA certs). If the default
 bundle file isn't adequate, you can specify an alternate file
 using the --cacert option.
If this HTTPS server uses a certificate signed by a CA represented in
 the bundle, the certificate verification probably failed due to a
 problem with the certificate (it might be expired, or the name might
 not match the domain name in the URL).
If you'd like to turn off curl's verification of the certificate, use
 the -k (or --insecure) option.
jason@The-Silverback-Bulldog: gatorApi $ rspec spec/requests/omniauth_callbacks_spec.rb 
I, [2014-12-07T11:26:42.421663 #6686]  INFO -- : Not reporting to Code Climate because ENV['CODECLIMATE_REPO_TOKEN'] is not set.

Omniauth Callbacks Controller
  #passthru

[7, 16] in /Users/jason/Documents/WebDevImmersive/Projects/Gator2/gatorApi/app/controllers/users/omniauth_callbacks_controller.rb
    7:     route_to_provider
    8:   end
    9: 
   10:   def route_to_provider
   11:     binding.byebug
=> 12:   end
   13:   # I expect the passthru action to route a request to a provider's
   14:   # request_token endpoint, and return a token: 
   15:   # https://api.twitter.com/oauth/request_token
   16:   # which then gets used to authorize Gator,
(byebug) uri = URI('https://api.twitter.com/oauth/request_token')
#<URI::HTTPS:0x007fdbb463c5d0 URL:https://api.twitter.com/oauth/request_token>
(byebug) Net::HTTP.get(uri)
"Failed to validate oauth signature and token"
(byebug) Net::HTTP.post(uri, {})
NoMethodError Exception: undefined method `post' for Net::HTTP:Class
nil
(byebug) urui
NameError Exception: undefined local variable or method `urui' for #<Users::OmniauthCallbacksController:0x007fdbb45a45f0>
nil
(byebug) uri
#<URI::HTTPS:0x007fdbb463c5d0 URL:https://api.twitter.com/oauth/request_token>
(byebug) Net::HTTP.start(uri.host, uri.port) do |http|
SyntaxError Exception: /Users/jason/Documents/WebDevImmersive/Projects/Gator2/gatorApi/app/controllers/users/omniauth_callbacks_controller.rb:12: syntax error, unexpected end-of-input
Net::HTTP.start(uri.host, uri.port) do |http|
                                             ^
nil
(byebug) exit
Really quit? (y/n) y
jason@The-Silverback-Bulldog: gatorApi $ rspec spec/requests/omniauth_callbacks_spec.rb 
I, [2014-12-07T11:34:11.084044 #7027]  INFO -- : Not reporting to Code Climate because ENV['CODECLIMATE_REPO_TOKEN'] is not set.

Omniauth Callbacks Controller
  #passthru
    responds successfully
    routes to the appropriate provider
    has a token from the authenticated user
  #route_to_provider
    routes the request to the appropriate provider (FAILED - 1)

Failures:

  1) Omniauth Callbacks Controller #route_to_provider routes the request to the appropriate provider
     Failure/Error: response = http.request request # Net::HTTPResponse object
     Errno::ECONNRESET:
       Connection reset by peer
     # ./spec/requests/omniauth_callbacks_spec.rb:55:in `block (4 levels) in <top (required)>'
     # ./spec/requests/omniauth_callbacks_spec.rb:53:in `block (3 levels) in <top (required)>'

Finished in 0.36128 seconds (files took 1.7 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/requests/omniauth_callbacks_spec.rb:59 # Omniauth Callbacks Controller #route_to_provider routes the request to the appropriate provider
jason@The-Silverback-Bulldog: gatorApi $ rspec spec/requests/omniauth_callbacks_spec.rb 
I, [2014-12-07T11:34:51.237542 #7060]  INFO -- : Not reporting to Code Climate because ENV['CODECLIMATE_REPO_TOKEN'] is not set.

Omniauth Callbacks Controller
  #passthru
    responds successfully
    routes to the appropriate provider
    has a token from the authenticated user
  #route_to_provider
    routes the request to the appropriate provider (FAILED - 1)

Failures:

  1) Omniauth Callbacks Controller #route_to_provider routes the request to the appropriate provider
     Failure/Error: response = http.request request # Net::HTTPResponse object
     Errno::ECONNRESET:
       Connection reset by peer
     # ./spec/requests/omniauth_callbacks_spec.rb:55:in `block (4 levels) in <top (required)>'
     # ./spec/requests/omniauth_callbacks_spec.rb:53:in `block (3 levels) in <top (required)>'

Finished in 0.29417 seconds (files took 1.48 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/requests/omniauth_callbacks_spec.rb:59 # Omniauth Callbacks Controller #route_to_provider routes the request to the appropriate provider
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> 
[4] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84ca25fe30 URL:https://api.twitter.com/oauth/request_token>
[5] pry(main)> Net::HTTP.start(uri.host, uri.port) do |http|
[5] pry(main)*   request = Net::HTTP::Get.new uri  
[5] pry(main)*   response = http.request request # Net::HTTPResponse object  
[5] pry(main)* end  
Errno::ECONNRESET: Connection reset by peer
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb:153:in `read_nonblock'
[6] pry(main)> subl /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb:153
SyntaxError: unexpected tSYMBEG, expecting end-of-input
...lib/ruby/2.1.0/net/protocol.rb:153
...                               ^
[6] pry(main)> /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb
SyntaxError: unexpected tINTEGER, expecting '('
/Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb
                                                  ^
[6] pry(main)> subl /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb
SyntaxError: unexpected tINTEGER, expecting '('
...ubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb
...                               ^
[6] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c981cf40 URL:https://api.twitter.com/oauth/request_token>
[2] pry(main)> uri.url
NoMethodError: undefined method `url' for #<URI::HTTPS:0x007f84c981cf40>
from (pry):2:in `<main>'
[3] pry(main)> uri
=> #<URI::HTTPS:0x007f84c981cf40 URL:https://api.twitter.com/oauth/request_token>
[4] pry(main)> uri['URL']
NoMethodError: undefined method `[]' for #<URI::HTTPS:0x007f84c981cf40>
from (pry):4:in `<main>'
[5] pry(main)> uri.URL
NoMethodError: undefined method `URL' for #<URI::HTTPS:0x007f84c981cf40>
from (pry):5:in `<main>'
[6] pry(main)> uri
=> #<URI::HTTPS:0x007f84c981cf40 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> params = {"provider"=>"twitter",
[7] pry(main)*   "uid"=>"20350433",    
[7] pry(main)*   "info"=>    
[7] pry(main)*   {"nickname"=>"jasonwharff",     
[7] pry(main)*     "name"=>"JasonWharff",      
[7] pry(main)*     "location"=>"boston",      
[7] pry(main)*     "image"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",      
[7] pry(main)*     "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",      
[7] pry(main)*   "urls"=>{"Website"=>"http://t.co/8oulbeIXyc", "Twitter"=>"https://twitter.com/jasonwharff"}},        
[7] pry(main)* "credentials"=>{"token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}})      
SyntaxError: unexpected ')', expecting end-of-input
[7] pry(main)> params = {"provider"=>"twitter",
[7] pry(main)*   "uid"=>"20350433",    
[7] pry(main)*   "info"=>    
[7] pry(main)*   {"nickname"=>"jasonwharff",     
[7] pry(main)*     "name"=>"JasonWharff",      
[7] pry(main)*     "location"=>"boston",      
[7] pry(main)*     "image"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",      
[7] pry(main)*     "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",      
[7] pry(main)*   "urls"=>{"Website"=>"http://t.co/8oulbeIXyc", "Twitter"=>"https://twitter.com/jasonwharff"}},        
[7] pry(main)* "credentials"=>{"token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}}      
=> {"provider"=>"twitter",
 "uid"=>"20350433",
 "info"=>
  {"nickname"=>"jasonwharff",
   "name"=>"JasonWharff",
   "location"=>"boston",
   "image"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",
   "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",
   "urls"=>{"Website"=>"http://t.co/8oulbeIXyc", "Twitter"=>"https://twitter.com/jasonwharff"}},
 "credentials"=>{"token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}}
[8] pry(main)> uri.query = URI.encode_www_form(params)
=> "provider=twitter&uid=20350433&info=%7B%22nickname%22%3D%3E%22jasonwharff%22%2C+%22name%22%3D%3E%22JasonWharff%22%2C+%22location%22%3D%3E%22boston%22%2C+%22image%22%3D%3E%22http%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F421134326584336384%2FAJhsD37b_normal.jpeg%22%2C+%22description%22%3D%3E%22Designer%2C+Developer%2C+Artist%2C+Professional+Tinkerer%2C+Constant+Learner.+I%27m+a+monster+that+gobbles+up+life.%22%2C+%22urls%22%3D%3E%7B%22Website%22%3D%3E%22http%3A%2F%2Ft.co%2F8oulbeIXyc%22%2C+%22Twitter%22%3D%3E%22https%3A%2F%2Ftwitter.com%2Fjasonwharff%22%7D%7D&credentials=%7B%22token%22%3D%3E%2220350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6%22%2C+%22secret%22%3D%3E%22HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur%22%7D"
[9] pry(main)> res = Net::HTTP.get_response(uri)
=> #<Net::HTTPUnauthorized 401 Authorization Required readbody=true>
[10] pry(main)> URI.parse(http%3A%2F%2F127.0.0.1%3A3005%users%2Fauth%2Ftwitter%2Fcallback)
SyntaxError: unexpected tCONSTANT, expecting end-of-input
URI.parse(http%3A%2F%2F127.0.0.1%3A3005%users%2Fa...
                    ^
[10] pry(main)> str = 'http://127.0.0.1/users/auth/twitter/callback'
=> "http://127.0.0.1/users/auth/twitter/callback"
[11] pry(main)> puts URI::encode(str)
http://127.0.0.1/users/auth/twitter/callback
=> nil
[12] pry(main)> puts URI::encode(str)
http://127.0.0.1/users/auth/twitter/callback
=> nil
[13] pry(main)> puts url_encode(str)
NoMethodError: undefined method `url_encode' for main:Object
from (pry):22:in `<main>'
[14] pry(main)> require "erb"
=> false
[15] pry(main)> include ERB::Util
=> Object
[16] pry(main)> puts url_encode(str)
http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback
=> nil
[17] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> require 'erb'
=> false
[4] pry(main)> include ERB::Util
=> Object
[5] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c8d2d468 URL:https://api.twitter.com/oauth/request_token>
[6] pry(main)> uri
=> #<URI::HTTPS:0x007f84c8d2d468 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> require 'erb'
=> false
[4] pry(main)> include ERB::Util
=> Object
[5] pry(main)> 
[6] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c7357e08 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> oauth = { "OAuth" => 
[7] pry(main)*   {  
[7] pry(main)*     "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",     
[7] pry(main)*     "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",     
[7] pry(main)*     "oauth_signature_method" => "HMAC-SHA1",     
[7] pry(main)*     "oauth_timestamp" => "1300228849",     
[7] pry(main)*     "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",     
[7] pry(main)*     "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",     
[7] pry(main)*     "oauth_version" => "1.0"    
[7] pry(main)*   }    
[7] pry(main)* }  
=> {"OAuth"=>
  {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
   "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
   "oauth_signature_method"=>"HMAC-SHA1",
   "oauth_timestamp"=>"1300228849",
   "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
   "oauth_version"=>"1.0"}}
[8] pry(main)> 
[9] pry(main)> request = Net::HTTP::Get.new uri
=> #<Net::HTTP::Get GET>
[10] pry(main)> request = Net::HTTP::POst.new uri
NameError: uninitialized constant Net::HTTP::POst
from (pry):18:in `<main>'
[11] pry(main)> request = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[12] pry(main)> request['OAuth'] = oauth
=> {"OAuth"=>
  {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
   "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
   "oauth_signature_method"=>"HMAC-SHA1",
   "oauth_timestamp"=>"1300228849",
   "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
   "oauth_version"=>"1.0"}}
[13] pry(main)> request
=> #<Net::HTTP::Post POST>
[14] pry(main)> p request.to_hash.inspect
"{\"accept-encoding\"=>[\"gzip;q=1.0,deflate;q=0.6,identity;q=0.3\"], \"accept\"=>[\"*/*\"], \"user-agent\"=>[\"Ruby\"], \"host\"=>[\"api.twitter.com\"], \"oauth\"=>[{\"OAuth\"=>{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}}]}"
=> "{\"accept-encoding\"=>[\"gzip;q=1.0,deflate;q=0.6,identity;q=0.3\"], \"accept\"=>[\"*/*\"], \"user-agent\"=>[\"Ruby\"], \"host\"=>[\"api.twitter.com\"], \"oauth\"=>[{\"OAuth\"=>{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}}]}"
[15] pry(main)> request.to_hash.inspect
=> "{\"accept-encoding\"=>[\"gzip;q=1.0,deflate;q=0.6,identity;q=0.3\"], \"accept\"=>[\"*/*\"], \"user-agent\"=>[\"Ruby\"], \"host\"=>[\"api.twitter.com\"], \"oauth\"=>[{\"OAuth\"=>{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}}]}"
[16] pry(main)> request.inspect
=> "#<Net::HTTP::Post POST>"
[17] pry(main)> request.to_hash.inspect
=> "{\"accept-encoding\"=>[\"gzip;q=1.0,deflate;q=0.6,identity;q=0.3\"], \"accept\"=>[\"*/*\"], \"user-agent\"=>[\"Ruby\"], \"host\"=>[\"api.twitter.com\"], \"oauth\"=>[{\"OAuth\"=>{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}}]}"
[18] pry(main)> http.request(request)
NameError: undefined local variable or method `http' for main:Object
from (pry):26:in `<main>'
[19] pry(main)> res = Net::HTTP.start(uri.hostname, uri.port) {|http|
[19] pry(main)*   http.request(request)  
[19] pry(main)* }  
Errno::ECONNRESET: Connection reset by peer
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb:153:in `read_nonblock'
[20] pry(main)> Net::HTTP.get(uri)
=> "Failed to validate oauth signature and token"
[21] pry(main)> Net::HTTP.post(uri, '/')
NoMethodError: undefined method `post' for Net::HTTP:Class
from (pry):31:in `<main>'
[22] pry(main)> res
=> nil
[23] pry(main)> Net::HTTP.post_form(uri, '/')
NoMethodError: undefined method `map' for "/":String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/uri/common.rb:933:in `encode_www_form'
[24] pry(main)> Net::HTTP.post_form(uri, {'/'})
SyntaxError: unexpected '}', expecting =>
Net::HTTP.post_form(uri, {'/'})
                              ^
[24] pry(main)> Net::HTTP.post_form(uri, {})
=> #<Net::HTTPUnauthorized 401 Authorization Required readbody=true>
[25] pry(main)> ls uri
URI::Generic#methods: 
  +   absolute   component     find_proxy  hash           host=      inspect  normalize   opaque=   password=  port   query=     relative?   scheme   to_s   userinfo 
  -   absolute?  default_port  fragment    hierarchical?  hostname   merge    normalize!  parser    path       port=  registry   route_from  scheme=  user   userinfo=
  ==  coerce     eql?          fragment=   host           hostname=  merge!   opaque      password  path=      query  registry=  route_to    select   user=
URI::HTTP#methods: request_uri
instance variables: @fragment  @host  @opaque  @parser  @password  @path  @port  @query  @registry  @scheme  @user
class variables: @@schemes  @@to_s
[26] pry(main)> uri['OAuth'] = {
[26] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[26] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[26] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[26] pry(main)*   "oauth_timestamp" => "1300228849",   
[26] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[26] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[26] pry(main)*   "oauth_version" => "1.0"  
[26] pry(main)* }  
NoMethodError: undefined method `[]=' for #<URI::HTTPS:0x007f84c7357e08>
from (pry):35:in `<main>'
[27] pry(main)> Net::HTTP.get(uri)
=> "Failed to validate oauth signature and token"
[28] pry(main)> uri['OAuth']
NoMethodError: undefined method `[]' for #<URI::HTTPS:0x007f84c7357e08>
from (pry):45:in `<main>'
[29] pry(main)> request['OAuth'] = {
[29] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[29] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[29] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[29] pry(main)*   "oauth_timestamp" => "1300228849",   
[29] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[29] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[29] pry(main)*   "oauth_version" => "1.0"  
[29] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[30] pry(main)> request['OAuth']
=> "{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}"
[31] pry(main)> request
=> #<Net::HTTP::Post POST>
[32] pry(main)> Net::HTTP.start(uri.host, uri.port) do |http|
[32] pry(main)*   http.request request
[32] pry(main)*   res = http.request request
[32] pry(main)* end  
Errno::ECONNRESET: Connection reset by peer
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb:153:in `read_nonblock'
[33] pry(main)> res = Net::HTTP.get_response(uri)
=> #<Net::HTTPUnauthorized 401 Authorization Required readbody=true>
[34] pry(main)> res['Set-Cookie']
=> "_twitter_sess=BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo%250ASGFzaHsABjoKQHVzZWR7ADoHaWQiJWZjYTZiNmE0YWY4Yjc1ODZjNDM1ZDVk%250AMWEwZmIyZTRiOg9jcmVhdGVkX2F0bCsI%252BBbJJUoB--d420c4616a0c0429e8662411f0ba0d965504724e; domain=.twitter.com; path=/; secure; HttpOnly, guest_id=v1%3A141797314312302692; Domain=.twitter.com; Path=/; Expires=Tue, 06-Dec-2016 17:25:43 UTC"
[35] pry(main)> res.get_fields('set-cookie')
=> ["_twitter_sess=BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo%250ASGFzaHsABjoKQHVzZWR7ADoHaWQiJWZjYTZiNmE0YWY4Yjc1ODZjNDM1ZDVk%250AMWEwZmIyZTRiOg9jcmVhdGVkX2F0bCsI%252BBbJJUoB--d420c4616a0c0429e8662411f0ba0d965504724e; domain=.twitter.com; path=/; secure; HttpOnly",
 "guest_id=v1%3A141797314312302692; Domain=.twitter.com; Path=/; Expires=Tue, 06-Dec-2016 17:25:43 UTC"]
[36] pry(main)> res.code
=> "401"
[37] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> require 'erb'
=> false
[4] pry(main)> include ERB::Util
=> Object
[5] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c8c2dd88 URL:https://api.twitter.com/oauth/request_token>
[6] pry(main)> oauth = {
[6] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[6] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[6] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[6] pry(main)*   "oauth_timestamp" => "1300228849",   
[6] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[6] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[6] pry(main)*   "oauth_version" => "1.0"  
[6] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[7] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[8] pry(main)> http = Net::HTTP.new(uri)\
[8] pry(main)* 
[8] pry(main)* next
Error: Cannot find local context. Did you use `binding.pry`?
[8] pry(main)* exit
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear







jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> require 'erb'
=> false
[4] pry(main)> include ERB::Util
=> Object
[5] pry(main)> 
[6] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c8864300 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> # url_encode(str) #=> http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback
[8] pry(main)> 
[9] pry(main)> # Authorization Header
[10] pry(main)> 
[11] pry(main)> oauth = {
[11] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[11] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[11] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[11] pry(main)*   "oauth_timestamp" => "1300228849",   
[11] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[11] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[11] pry(main)*   "oauth_version" => "1.0"  
[11] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[12] pry(main)> 
[13] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[14] pry(main)> http = Net::HTTP.new(uri)
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[15] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[16] pry(main)> 
[17] pry(main)> require 'net/http'
=> false
[18] pry(main)> require 'uri'
=> false
[19] pry(main)> require 'erb'
=> false
[20] pry(main)> include ERB::Util
=> Object
[21] pry(main)> 
[22] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c346ee30 URL:https://api.twitter.com/oauth/request_token>
[23] pry(main)> # url_encode(str) #=> http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback
[24] pry(main)> 
[25] pry(main)> # Authorization Header
[26] pry(main)> 
[27] pry(main)> oauth = {
[27] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[27] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[27] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[27] pry(main)*   "oauth_timestamp" => "1300228849",   
[27] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[27] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[27] pry(main)*   "oauth_version" => "1.0"  
[27] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[28] pry(main)> 
[29] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[30] pry(main)> http = Net::HTTP.new(uri)
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[31] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[32] pry(main)> 
[33] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> require 'erb'
=> false
[4] pry(main)> include ERB::Util
=> Object
[5] pry(main)> 
[6] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c16b5ec0 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> # url_encode(str) #=> http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback
[8] pry(main)> 
[9] pry(main)> # Authorization Header
[10] pry(main)> 
[11] pry(main)> oauth = {
[11] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[11] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[11] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[11] pry(main)*   "oauth_timestamp" => "1300228849",   
[11] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[11] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[11] pry(main)*   "oauth_version" => "1.0"  
[11] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[12] pry(main)> 
[13] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[14] pry(main)> http = Net::HTTP.new(uri)
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[15] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[16] pry(main)> http
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[17] pry(main)> req
=> #<Net::HTTP::Post POST>
[18] pry(main)> http.request req
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[19] pry(main)> ur
NameError: undefined local variable or method `ur' for main:Object
from (pry):23:in `<main>'
[20] pry(main)> uri
=> #<URI::HTTPS:0x007f84c16b5ec0 URL:https://api.twitter.com/oauth/request_token>
[21] pry(main)> req = Net::HTTP::Post.new
ArgumentError: wrong number of arguments (0 for 1..2)
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/request.rb:13:in `initialize'
[22] pry(main)> http
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[23] pry(main)> http.request(req)
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[24] pry(main)> req
=> #<Net::HTTP::Post POST>
[25] pry(main)> req.to_hash.inspect
=> "{\"accept-encoding\"=>[\"gzip;q=1.0,deflate;q=0.6,identity;q=0.3\"], \"accept\"=>[\"*/*\"], \"user-agent\"=>[\"Ruby\"], \"host\"=>[\"api.twitter.com\"], \"oauth\"=>[{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}]}"
[26] pry(main)> uri
=> #<URI::HTTPS:0x007f84c16b5ec0 URL:https://api.twitter.com/oauth/request_token>
[27] pry(main)> uri.to_s
=> "https://api.twitter.com/oauth/request_token"
[28] pry(main)> http.request(req)
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[29] pry(main)> http = Net::HTTP.new(req)
=> #<Net::HTTP #<Net::HTTP::Post:0x007f84c36174f8>:80 open=false>
[30] pry(main)> http.request(req)
URI::InvalidURIError: bad URI(is not URI?): http://#<Net::HTTP::Post:0x007f84c36174f8>:80
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/uri/common.rb:176:in `split'
[31] pry(main)> req
=> #<Net::HTTP::Post POST>
[32] pry(main)> req.request(req)
NoMethodError: undefined method `request' for #<Net::HTTP::Post POST>
from (pry):36:in `<main>'
[33] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'uri'
=> false
[3] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c3c36dc0 URL:https://api.twitter.com/oauth/request_token>
[4] pry(main)> http = Net::HTTP.new uri
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[5] pry(main)> oauth = {
[5] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[5] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[5] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[5] pry(main)*   "oauth_timestamp" => "1300228849",   
[5] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[5] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[5] pry(main)*   "oauth_version" => "1.0"  
[5] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[6] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[7] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[8] pry(main)> http.request req
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[9] pry(main)> require 'open-uri
[9] pry(main)* '
LoadError: cannot load such file -- open-uri
from /Users/jason/.rvm/gems/ruby-2.1.2/gems/activesupport-4.2.0.beta2/lib/active_support/dependencies.rb:248:in `require'
[10] pry(main)> require 'open-uri'
=> true
[11] pry(main)> http.request req
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[12] pry(main)> uri.url
NoMethodError: undefined method `url' for #<URI::HTTPS:0x007f84c3c36dc0>
from (pry):21:in `<main>'
[13] pry(main)> uri
=> #<URI::HTTPS:0x007f84c3c36dc0 URL:https://api.twitter.com/oauth/request_token>
[14] pry(main)> uri.attributes
NoMethodError: undefined method `attributes' for #<URI::HTTPS:0x007f84c3c36dc0>
from (pry):23:in `<main>'
[15] pry(main)> ls uri
URI::Generic#methods: 
  +   absolute   component     find_proxy  hash           host=      inspect  normalize   opaque=   password=  port   query=     relative?   scheme   to_s   userinfo 
  -   absolute?  default_port  fragment    hierarchical?  hostname   merge    normalize!  parser    path       port=  registry   route_from  scheme=  user   userinfo=
  ==  coerce     eql?          fragment=   host           hostname=  merge!   opaque      password  path=      query  registry=  route_to    select   user=
OpenURI::OpenRead#methods: open  read
URI::HTTP#methods: buffer_open  request_uri
instance variables: @fragment  @host  @opaque  @parser  @password  @path  @port  @query  @registry  @scheme  @user
class variables: @@schemes  @@to_s
[16] pry(main)> uri.port
=> 443
[17] pry(main)> uri.hos
NoMethodError: undefined method `hos' for #<URI::HTTPS:0x007f84c3c36dc0>
from (pry):25:in `<main>'
[18] pry(main)> uri.host
=> "api.twitter.com"
[19] pry(main)> uri.to_s
=> "https://api.twitter.com/oauth/request_token"
[20] pry(main)> uri.route_to
ArgumentError: wrong number of arguments (0 for 1)
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/uri/generic.rb:1413:in `route_to'
[21] pry(main)> uri.userinfo
=> nil
[22] pry(main)> uri.inspect
=> "#<URI::HTTPS:0x007f84c3c36dc0 URL:https://api.twitter.com/oauth/request_token>"
[23] pry(main)> uri.to_s
=> "https://api.twitter.com/oauth/request_token"
[24] pry(main)> http
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:80 open=false>
[25] pry(main)> http.request request
NameError: undefined local variable or method `request' for main:Object
from (pry):33:in `<main>'
[26] pry(main)> req
=> #<Net::HTTP::Post POST>
[27] pry(main)> req['OAuth']
=> "{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}"
[28] pry(main)> http.request req
TypeError: no implicit conversion of URI::HTTPS into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[29] pry(main)> uri = uri.scheme
=> "https"
[30] pry(main)> uri.path
NoMethodError: undefined method `path' for "https":String
from (pry):38:in `<main>'
[31] pry(main)> uri.query
NoMethodError: undefined method `query' for "https":String
from (pry):39:in `<main>'
[32] pry(main)> uri.fragment
NoMethodError: undefined method `fragment' for "https":String
from (pry):40:in `<main>'
[33] pry(main)> uri = URI("https://api.twitter.com/oauth/request_token")
=> #<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
[34] pry(main)> p uri
#<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
=> #<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
[35] pry(main)> p uri.to_s
"https://api.twitter.com/oauth/request_token"
=> "https://api.twitter.com/oauth/request_token"
[36] pry(main)> p uri
#<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
=> #<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
[37] pry(main)> req.url = uri
NoMethodError: undefined method `url=' for #<Net::HTTP::Post POST>
from (pry):45:in `<main>'
[38] pry(main)> req
=> #<Net::HTTP::Post POST>
[39] pry(main)> http = Net.HTTP.new(uri.host,uri.port,:use_ssl => uri.scheme == 'https')
NoMethodError: undefined method `HTTP' for Net:Module
from (pry):47:in `<main>'
[40] pry(main)> http = Net.HTTPs.new(uri.host,uri.port,:use_ssl => uri.scheme == 'https')
NoMethodError: undefined method `HTTPs' for Net:Module
from (pry):48:in `<main>'
[41] pry(main)> http = Net::HTTP.new(uri.host,uri.port,:use_ssl => uri.scheme == 'https')
=> #<Net::HTTP api.twitter.com:443 open=false>
[42] pry(main)> http.request req
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[43] pry(main)> uri
=> #<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
[44] pry(main)> http
=> #<Net::HTTP api.twitter.com:443 open=false>
[45] pry(main)> http
=> #<Net::HTTP api.twitter.com:443 open=false>
[46] pry(main)> http.request_post req
ArgumentError: wrong number of arguments (1 for 2..3)
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:1323:in `request_post'
[47] pry(main)> http.request_post(req, {})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[48] pry(main)> http.request_post(req, {},{})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[49] pry(main)> http.request_post(uri, req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[50] pry(main)> http.request_post(uri, req.to_s)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[51] pry(main)> http.request_post(uri, req.to_hash)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[52] pry(main)> req
=> #<Net::HTTP::Post POST>
[53] pry(main)> req['OAuth']
=> "{\"oauth_nonce\"=>\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\", \"oauth_callback\"=>\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\", \"oauth_signature_method\"=>\"HMAC-SHA1\", \"oauth_timestamp\"=>\"1300228849\", \"oauth_consumer_key\"=>\"Ja2vRzXC1C0KDw7uaNFbbWoZs\", \"oauth_signature\"=>\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\", \"oauth_version\"=>\"1.0\"}"
[54] pry(main)> req
=> #<Net::HTTP::Post POST>
[55] pry(main)> ls req
Net::HTTPHeader#methods: 
  []              connection_close?       content_type      each_capitalized_name  fetch                   length            range_length      size       
  add_field       connection_keep_alive?  content_type=     each_header            form_data=              main_type         set_content_type  sub_type   
  basic_auth      content_length          delete            each_key               get_fields              proxy_basic_auth  set_form          to_hash    
  canonical_each  content_length=         each              each_name              initialize_http_header  range             set_form_data     type_params
  chunked?        content_range           each_capitalized  each_value             key?                    range=            set_range       
OAuth::Helper#methods: escape  generate_key  generate_nonce  generate_timestamp  normalize  normalize_nested_query  parse_header  stringify_keys  unescape
Net::HTTPGenericRequest#methods: 
  []=   body=        body_stream   decode_content  inspect  oauth!        path                     response_body_permitted?  signature_base_string  uri
  body  body_exist?  body_stream=  exec            method   oauth_helper  request_body_permitted?  set_body_internal         update_uri           
instance variables: @body  @body_data  @body_stream  @decode_content  @header  @method  @path  @request_has_body  @response_has_body  @uri
[56] pry(main)> req.each_header
=> #<Enumerator: ...>
[57] pry(main)> req.each_header { |head| p head } 
"accept-encoding"
"accept"
"user-agent"
"host"
"oauth"
=> {"accept-encoding"=>["gzip;q=1.0,deflate;q=0.6,identity;q=0.3"],
 "accept"=>["*/*"],
 "user-agent"=>["Ruby"],
 "host"=>["api.twitter.com"],
 "oauth"=>
  [{"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
    "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
    "oauth_signature_method"=>"HMAC-SHA1",
    "oauth_timestamp"=>"1300228849",
    "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
    "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
    "oauth_version"=>"1.0"}]}
[58] pry(main)> req
=> #<Net::HTTP::Post POST>
[59] pry(main)> http
=> #<Net::HTTP api.twitter.com:443 open=false>
[60] pry(main)> http.send_request('POST',uri)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[61] pry(main)> uri
=> #<URI::HTTPS:0x007f84c349d2a8 URL:https://api.twitter.com/oauth/request_token>
[62] pry(main)> http.send_request('POST',uri,{})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[63] pry(main)> http.send_request('POST',uri,{},{})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[64] pry(main)> http.request_post(uri, {req})
SyntaxError: unexpected '}', expecting =>
http.request_post(uri, {req})
                            ^
[64] pry(main)> http.request_post(uri, {params => req})
NameError: undefined local variable or method `params' for main:Object
from (pry):71:in `<main>'
[65] pry(main)> http.request_post(uri, req, {})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[66] pry(main)> http.request_post(req,{},{})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[67] pry(main)> http.request_post(req,{"" => ""},{})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[68] pry(main)> http.request_post(req,{"" => ""},{"" => ""})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[69] pry(main)> http.request_post(req,{"" => ""})
NoMethodError: undefined method `empty?' for #<Net::HTTP::Post POST>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:27:in `initialize'
[70] pry(main)> http.request_post(uri, {}) { |response| p response.status }
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[71] pry(main)> http.request_post(uri,req,{})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[72] pry(main)> req.uri
=> #<URI::HTTPS:0x007f84ca0e8610 URL:https://api.twitter.com/oauth/request_token>
[73] pry(main)> req
=> #<Net::HTTP::Post POST>
[74] pry(main)> req.uri
=> #<URI::HTTPS:0x007f84ca0e8610 URL:https://api.twitter.com/oauth/request_token>
[75] pry(main)> http.request_post(req.uri,req,{})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[76] pry(main)> req
=> #<Net::HTTP::Post POST>
[77] pry(main)> req.REQUEST_HAS_BODY
NoMethodError: undefined method `REQUEST_HAS_BODY' for #<Net::HTTP::Post POST>
from (pry):84:in `<main>'
[78] pry(main)> REQUEST_HAS_BODY
NameError: uninitialized constant REQUEST_HAS_BODY
from (pry):85:in `<main>'
[79] pry(main)> req
=> #<Net::HTTP::Post POST>
[80] pry(main)> req.REQUEST_HAS_BODY = false
NoMethodError: undefined method `REQUEST_HAS_BODY=' for #<Net::HTTP::Post POST>
from (pry):87:in `<main>'
[81] pry(main)> req
=> #<Net::HTTP::Post POST>
[82] pry(main)> http.requst(uri)
NoMethodError: undefined method `requst' for #<Net::HTTP api.twitter.com:443 open=false>
from (pry):89:in `<main>'
[83] pry(main)> http.request(uri)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[84] pry(main)> http.request(uri, req, {})
ArgumentError: wrong number of arguments (3 for 1..2)
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:1367:in `request'
[85] pry(main)> http.request(uri, req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[86] pry(main)> http.request(uri, {})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[87] pry(main)> http
=> #<Net::HTTP api.twitter.com:443 open=false>
[88] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'open-uri'
=> true
[3] pry(main)> require 'uri'
=> false
[4] pry(main)> require 'erb'
=> false
[5] pry(main)> include ERB::Util
=> Object
[6] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c3624e50 URL:https://api.twitter.com/oauth/request_token>
[7] pry(main)> http = Net::HTTP.new(uri.host,uri.port,:use_ssl => uri.scheme == 'https')
=> #<Net::HTTP api.twitter.com:443 open=false>
[8] pry(main)> http = Net::HTTP.new(uri,uri.port,:use_ssl => uri.scheme == 'https')
=> #<Net::HTTP https://api.twitter.com/oauth/request_token:443 open=false>
[9] pry(main)> oauth = {
[9] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[9] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[9] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[9] pry(main)*   "oauth_timestamp" => "1300228849",   
[9] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[9] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[9] pry(main)*   "oauth_version" => "1.0"  
[9] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[10] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[11] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[12] pry(main)> http.request_post(req.uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c3975258>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[13] pry(main)> http.request_post(uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c14b9b08>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[14] pry(main)> http.request_post(uri,req,req['OAuth'].to_hash)
NoMethodError: undefined method `to_hash' for #<String:0x007f84c12a9548>
from (pry):22:in `<main>'
[15] pry(main)> http.request_post(uri,req,req['OAuth'].to_json)
NoMethodError: undefined method `keys' for #<String:0x007f84c38a9bd0>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[16] pry(main)> http.request_post(uri,req,{})
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[17] pry(main)> http.request_post(uri,req,oauth = {)
SyntaxError: unexpected ')', expecting '}'
[17] pry(main)> "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw", 
                ^
[17] pry(main)> "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fus...
                   ^
[17] pry(main)> "oauth_signature_method" => "HMAC-SHA1",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_signature_method" => "HMAC-SHA1", 
                           ^
[17] pry(main)> "oauth_timestamp" => "1300228849",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_timestamp" => "1300228849", 
                    ^
[17] pry(main)> "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs", 
                       ^
[17] pry(main)> "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
SyntaxError: unexpected =>, expecting end-of-input
"oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D", 
                    ^
[17] pry(main)> "oauth_version" => "1.0"  
SyntaxError: unexpected =>, expecting end-of-input
"oauth_version" => "1.0"
                  ^
[17] pry(main)> }.to_json
SyntaxError: unexpected tSTRING_DEND, expecting end-of-input
}.to_json
 ^
[17] pry(main)> oauth = {
[17] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[17] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[17] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[17] pry(main)*   "oauth_timestamp" => "1300228849",   
[17] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[17] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[17] pry(main)*   "oauth_version" => "1.0"  
[17] pry(main)* }.to_json  
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[18] pry(main)> req['OAuth'] = oauth
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[19] pry(main)> http.request_post(req.uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c736d370>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[20] pry(main)> http.request_post(req.uri,req,req['OAuth'].to_json)
NoMethodError: undefined method `keys' for #<String:0x007f84c25d8ec0>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[21] pry(main)> http.request_post(req.uri,req,req['OAuth'].to_hash)
NoMethodError: undefined method `to_hash' for #<String:0x007f84ca070bd8>
from (pry):37:in `<main>'
[22] pry(main)> oauth
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[23] pry(main)> oauth.to_hash
NoMethodError: undefined method `to_hash' for #<String:0x007f84c25c9bf0>
from (pry):39:in `<main>'
[24] pry(main)> JSON.parse(oauth)
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[25] pry(main)> oauth = JSON.parse(oauth)
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[26] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[27] pry(main)> http.request_post(req.uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84ca0bbf98>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[28] pry(main)> http.request_post(uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c25ffc50>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[29] pry(main)> http.request_post(uri,{},req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c25ef788>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[30] pry(main)> uri = URI.parse("https://api.twitter.com/oauth/request_token")
=> #<URI::HTTPS:0x007f84c5077550 URL:https://api.twitter.com/oauth/request_token>
[31] pry(main)> https = Net::HTTP.new(uri.host, uri.port)
=> #<Net::HTTP api.twitter.com:443 open=false>
[32] pry(main)> req = Net::HTTP::POST.new(uri.path)
NameError: uninitialized constant Net::HTTP::POST
from (pry):48:in `<main>'
[33] pry(main)> req = Net::HTTP::Post.new(uri.path)
=> #<Net::HTTP::Post POST>
[34] pry(main)> req['foo'] = bar
NameError: undefined local variable or method `bar' for main:Object
from (pry):50:in `<main>'
[35] pry(main)> req['foo'] = 'bar'
=> "bar"
[36] pry(main)> res = https.request(req)
Errno::ECONNRESET: Connection reset by peer
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/protocol.rb:153:in `read_nonblock'
[37] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> oauth = {
[1] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[1] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[1] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[1] pry(main)*   "oauth_timestamp" => "1300228849",   
[1] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[1] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[1] pry(main)*   "oauth_version" => "1.0"  
[1] pry(main)* }.to_json  
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[2] pry(main)> oauth = {
[2] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[2] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[2] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[2] pry(main)*   "oauth_timestamp" => "1300228849",   
[2] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[2] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[2] pry(main)*   "oauth_version" => "1.0"  
[2] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[3] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear














jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> require 'net/http'
=> false
[2] pry(main)> require 'open-uri'
=> true
[3] pry(main)> require 'uri'
=> false
[4] pry(main)> require 'erb'
=> false
[5] pry(main)> include ERB::Util
=> Object
[6] pry(main)> 
[7] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007f84c8a44530 URL:https://api.twitter.com/oauth/request_token>
[8] pry(main)> http = Net::HTTP.new(uri.host,uri.port,initheader = {'Content-Type' =>'application/json', :use_ssl => uri.scheme == 'https'})
=> #<Net::HTTP api.twitter.com:443 open=false>
[9] pry(main)> http.initheader
NoMethodError: undefined method `initheader' for #<Net::HTTP api.twitter.com:443 open=false>
from (pry):8:in `<main>'
[10] pry(main)> http
=> #<Net::HTTP api.twitter.com:443 open=false>
[11] pry(main)> oauth = {
[11] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[11] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[11] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[11] pry(main)*   "oauth_timestamp" => "1300228849",   
[11] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[11] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[11] pry(main)*   "oauth_version" => "1.0"  
[11] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[12] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[13] pry(main)> req['OAuth'] = oauth
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[14] pry(main)> oauth = JSON.parse(oauth)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/json/common.rb:155:in `initialize'
[15] pry(main)> JSON.parse(oauth)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/json/common.rb:155:in `initialize'
[16] pry(main)> oauth.to_json
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[17] pry(main)> JSON.parse(oauth)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/json/common.rb:155:in `initialize'
[18] pry(main)> oauth = oauth.to_json
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[19] pry(main)> JSON.parse(oauth)
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[20] pry(main)> oauth
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[21] pry(main)> req['OAuth'] = oauth
=> "{\"oauth_nonce\":\"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw\",\"oauth_callback\":\"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback\",\"oauth_signature_method\":\"HMAC-SHA1\",\"oauth_timestamp\":\"1300228849\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_signature\":\"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D\",\"oauth_version\":\"1.0\"}"
[22] pry(main)> http.request_post(req.uri,req,req['OAuth'])
NoMethodError: undefined method `keys' for #<String:0x007f84c3796068>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[23] pry(main)> http.request_post(req.uri,req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[24] pry(main)> http.request_post(uri,req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[25] pry(main)> http.request_post(uri,req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[26] pry(main)> res = http.request(req)
TypeError: no implicit conversion of Hash into String
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http.rb:879:in `initialize'
[27] pry(main)> request
NameError: undefined local variable or method `request' for main:Object
from (pry):34:in `<main>'
[28] pry(main)> req
=> #<Net::HTTP::Post POST>
[29] pry(main)> url_encode(oauth)
=> "%7B%22oauth_nonce%22%3A%22K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw%22%2C%22oauth_callback%22%3A%22http%253A%252F%252F127.0.0.1%252Fusers%252Fauth%252Ftwitter%252Fcallback%22%2C%22oauth_signature_method%22%3A%22HMAC-SHA1%22%2C%22oauth_timestamp%22%3A%221300228849%22%2C%22oauth_consumer_key%22%3A%22Ja2vRzXC1C0KDw7uaNFbbWoZs%22%2C%22oauth_signature%22%3A%22Pc%252BMLdv028fxCErFyi8KXFM%252BddU%253D%22%2C%22oauth_version%22%3A%221.0%22%7D"
[30] pry(main)> oauth = url_encode(oauth)
=> "%7B%22oauth_nonce%22%3A%22K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw%22%2C%22oauth_callback%22%3A%22http%253A%252F%252F127.0.0.1%252Fusers%252Fauth%252Ftwitter%252Fcallback%22%2C%22oauth_signature_method%22%3A%22HMAC-SHA1%22%2C%22oauth_timestamp%22%3A%221300228849%22%2C%22oauth_consumer_key%22%3A%22Ja2vRzXC1C0KDw7uaNFbbWoZs%22%2C%22oauth_signature%22%3A%22Pc%252BMLdv028fxCErFyi8KXFM%252BddU%253D%22%2C%22oauth_version%22%3A%221.0%22%7D"
[31] pry(main)> req['OAuth'] = oauth
=> "%7B%22oauth_nonce%22%3A%22K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw%22%2C%22oauth_callback%22%3A%22http%253A%252F%252F127.0.0.1%252Fusers%252Fauth%252Ftwitter%252Fcallback%22%2C%22oauth_signature_method%22%3A%22HMAC-SHA1%22%2C%22oauth_timestamp%22%3A%221300228849%22%2C%22oauth_consumer_key%22%3A%22Ja2vRzXC1C0KDw7uaNFbbWoZs%22%2C%22oauth_signature%22%3A%22Pc%252BMLdv028fxCErFyi8KXFM%252BddU%253D%22%2C%22oauth_version%22%3A%221.0%22%7D"
[32] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ pwd
/Users/jason/Documents/WebDevImmersive/Projects/Gator2/gatorApi
jason@The-Silverback-Bulldog: gatorApi $ ls
Gemfile		README.md	Rakefile	bin		config.ru	docs		log		spec
Gemfile.lock	README.rdoc	app		config		db		lib		public		tmp
jason@The-Silverback-Bulldog: gatorApi $ cd ../
jason@The-Silverback-Bulldog: Gator2 $ ls
gatorApi	twitter_rest.rb	webapp
jason@The-Silverback-Bulldog: Gator2 $ git clone git@github.com:laserlemon/simple_oauth.git
Cloning into 'simple_oauth'...
remote: Counting objects: 739, done.
remote: Total 739 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (739/739), 108.96 KiB | 0 bytes/s, done.
Resolving deltas: 100% (333/333), done.
Checking connectivity... done.
jason@The-Silverback-Bulldog: Gator2 $ ls
gatorApi	simple_oauth	twitter_rest.rb	webapp
jason@The-Silverback-Bulldog: Gator2 $ cd simple_oauth/
jason@The-Silverback-Bulldog: simple_oauth $ subl
jason@The-Silverback-Bulldog: simple_oauth $ subl .
jason@The-Silverback-Bulldog: simple_oauth $ rspec
...........................**.............

Pending:
  SimpleOAuth::Header#private_key 
    # Not yet implemented
    # ./spec/simple_oauth/header_spec.rb:366
  SimpleOAuth::Header.unescape 
    # Not yet implemented
    # ./spec/simple_oauth/header_spec.rb:69

Finished in 0.03797 seconds (files took 0.71103 seconds to load)
42 examples, 0 failures, 2 pending

Randomized with seed 12949

Coverage report generated for RSpec to /Users/jason/Documents/WebDevImmersive/Projects/Gator2/simple_oauth/coverage. 74 / 74 LOC (100.0%) covered.
[Coveralls] Outside the Travis environment, not sending data.
jason@The-Silverback-Bulldog: simple_oauth $ cd ../
jason@The-Silverback-Bulldog: Gator2 $ ls
gatorApi	simple_oauth	twitter_rest.rb	webapp
jason@The-Silverback-Bulldog: Gator2 $ cd gatorApi/
jason@The-Silverback-Bulldog: gatorApi $ bundle
Using rake 10.4.2
Using i18n 0.7.0.beta1
Using json 1.8.1
Using minitest 5.4.3
Using thread_safe 0.3.4
Using tzinfo 1.2.2
Using activesupport 4.2.0.beta2
Using builder 3.2.2
Using erubis 2.7.0
Using mini_portile 0.6.1
Using nokogiri 1.6.5
Using rails-deprecated_sanitizer 1.0.3
Using rails-dom-testing 1.0.5
Using loofah 2.0.1
Using rails-html-sanitizer 1.0.1
Using actionview 4.2.0.beta2
Using rack 1.6.0.beta2
Using rack-test 0.6.2
Using actionpack 4.2.0.beta2
Using globalid 0.3.0
Using activejob 4.2.0.beta2
Using mime-types 2.4.3
Using mail 2.6.3
Using actionmailer 4.2.0.beta2
Using activemodel 4.2.0.beta2
Using active_model_serializers 0.10.0.pre from git://github.com/rails-api/active_model_serializers.git (at master)
Using arel 6.0.0.beta2
Using activerecord 4.2.0.beta2
Using addressable 2.3.6
Using bcrypt 3.1.9
Using bcrypt-ruby 3.1.5
Using debug_inspector 0.0.2
Using binding_of_caller 0.7.2
Using buftok 0.2.0
Using uniform_notifier 1.6.2
Using bullet 4.14.0
Using columnize 0.8.9
Using debugger-linecache 1.2.0
Using slop 3.6.0
Using byebug 3.5.1
Using docile 1.1.5
Using multi_json 1.10.1
Using simplecov-html 0.8.0
Using simplecov 0.9.1
Using codeclimate-test-reporter 0.4.3
Using coderay 1.1.0
Using curb 0.8.6
Using daemons 1.1.9
Using diff-lcs 1.2.5
Using dotenv 1.0.2
Using dotenv-rails 1.0.2
Using equalizer 0.0.9
Using eventmachine 1.0.3
Using factory_girl 4.5.0
Using thor 0.19.1
Using railties 4.2.0.beta2
Using factory_girl_rails 4.5.0
Using faker 1.4.3
Using multipart-post 2.0.0
Using faraday 0.9.0
Using faraday_middleware 0.9.1
Using sax-machine 1.1.1
Using feedjira 1.5.0
Using hashie 3.3.2
Using hike 1.2.3
Using http_parser.rb 0.6.0
Using http 0.6.3
Using instagram 1.1.3
Using kgio 2.9.2
Using oauth 0.4.7
Using linkedin 1.0.0
Using memoizable 0.4.2
Using method_source 0.8.2
Using naught 1.0.0
Using pg 0.17.1
Using pry 0.10.1
Using pry-byebug 2.0.0
Using pry-rails 0.3.2
Using rack-cors 0.2.9
Using rack-ssl-enforcer 0.2.8
Using bundler 1.6.2
Using tilt 1.4.1
Using sprockets 2.12.3
Using sprockets-rails 3.0.0.beta1
Using rails 4.2.0.beta2
Using rails-api 0.3.1
Using rails_serve_static_assets 0.0.2
Using rails_stdout_logging 0.0.3
Using rails_12factor 0.0.3
Using raindrops 0.13.0
Using rspec-support 3.0.4
Using rspec-core 3.0.4
Using rspec-expectations 3.0.4
Using rspec-mocks 3.0.4
Using rspec-rails 3.0.2
Using simple_oauth 0.3.0
Using spring 1.2.0
Using thin 1.6.3
Using twitter 5.13.0
Using unicorn 4.8.3
Using web-console 2.0.0
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> SimpleOAuth::Header
=> SimpleOAuth::Header
[2] pry(main)> SimpleOAuth::Header.new(:get, 'https://api.twitter.com/oauth/request_token', {})
=> #<SimpleOAuth::Header:0x007fb65827aea0
 @method="GET",
 @options={:nonce=>"40763d8e33d2a5b79016a2a141ef413a", :signature_method=>"HMAC-SHA1", :timestamp=>"1417980085", :version=>"1.0"},
 @params={},
 @uri=#<URI::HTTPS:0x007fb65827a158 URL:https://api.twitter.com/oauth/request_token>>
[3] pry(main)> SimpleOAuth::Header.new(:post, 'https://api.twitter.com/oauth/request_token', {})
=> #<SimpleOAuth::Header:0x007fb65835a410
 @method="POST",
 @options={:nonce=>"0cbd7e2436775bf2d15e95a7790e2dd4", :signature_method=>"HMAC-SHA1", :timestamp=>"1417980094", :version=>"1.0"},
 @params={},
 @uri=#<URI::HTTPS:0x007fb658359df8 URL:https://api.twitter.com/oauth/request_token>>
[4] pry(main)> oauth = SimpleOAuth::Header.new(:post, 'https://api.twitter.com/oauth/request_token', {})
=> #<SimpleOAuth::Header:0x007fb658410648
 @method="POST",
 @options={:nonce=>"4a5714477b0ff4ca7cf82717bf3d3ac2", :signature_method=>"HMAC-SHA1", :timestamp=>"1417980175", :version=>"1.0"},
 @params={},
 @uri=#<URI::HTTPS:0x007fb6584100a8 URL:https://api.twitter.com/oauth/request_token>>
[5] pry(main)> oauth.attributes
NoMethodError: private method `attributes' called for #<SimpleOAuth::Header:0x007fb658410648>
from (pry):5:in `<main>'
[6] pry(main)> oauth.valid?
=> false
[7] pry(main)> oauth.to_s
=> "OAuth oauth_nonce=\"4a5714477b0ff4ca7cf82717bf3d3ac2\", oauth_signature=\"C0DYigMdmNQet6GktKDnFqFZtdU%3D\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1417980175\", oauth_version=\"1.0\""
[8] pry(main)> oauth.url
=> "https://api.twitter.com/oauth/request_token"
[9] pry(main)> oauth.attributesexit
NoMethodError: undefined method `attributesexit' for #<SimpleOAuth::Header:0x007fb658410648>
from (pry):9:in `<main>'
[10] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> oauth = {
[1] pry(main)*   "oauth_nonce" => "K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",   
[1] pry(main)*   "oauth_callback" => "http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",   
[1] pry(main)*   "oauth_signature_method" => "HMAC-SHA1",   
[1] pry(main)*   "oauth_timestamp" => "1300228849",   
[1] pry(main)*   "oauth_consumer_key" => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[1] pry(main)*   "oauth_signature" => "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",   
[1] pry(main)*   "oauth_version" => "1.0"  
[1] pry(main)* }  
=> {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[2] pry(main)> twitter_auth = SimpleOAuth::Header.new(:post, 'https://api.twitter.com/oauth/request_token', oauth)
=> #<SimpleOAuth::Header:0x007fb65b8d3f60
 @method="POST",
 @options={:nonce=>"6aee14ae9f68452bbcdf38a671d44bc3", :signature_method=>"HMAC-SHA1", :timestamp=>"1417980334", :version=>"1.0"},
 @params=
  {"oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
   "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
   "oauth_signature_method"=>"HMAC-SHA1",
   "oauth_timestamp"=>"1300228849",
   "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
   "oauth_version"=>"1.0"},
 @uri=#<URI::HTTPS:0x007fb65b8d3c68 URL:https://api.twitter.com/oauth/request_token>>
[3] pry(main)> twitter_auth.options.merge(oauth)
=> {:nonce=>"6aee14ae9f68452bbcdf38a671d44bc3",
 :signature_method=>"HMAC-SHA1",
 :timestamp=>"1417980334",
 :version=>"1.0",
 "oauth_nonce"=>"K7ny27JTpKVsTgdyLdDfmQQWVLERj2zAK5BslRsqyw",
 "oauth_callback"=>"http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallback",
 "oauth_signature_method"=>"HMAC-SHA1",
 "oauth_timestamp"=>"1300228849",
 "oauth_consumer_key"=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 "oauth_signature"=>"Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D",
 "oauth_version"=>"1.0"}
[4] pry(main)> twitter_auth.valid?
=> false
[5] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> oauth = {
[1] pry(main)*   :oauth_callback => "http://127.0.0.1/users/auth/twitter/callback",   
[1] pry(main)*   :oauth_consumer_key => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[1] pry(main)*   :oauth_token_secret => "HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"  
[1] pry(main)* }  
=> {:oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
 :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}
[2] pry(main)> twitter_auth = SimpleOAuth::Header.new(:post, 'https://api.twitter.com/oauth/request_token', oauth)
=> #<SimpleOAuth::Header:0x007fb652fc0520
 @method="POST",
 @options={:nonce=>"11f8339f9812f47fae343a68faf6f00e", :signature_method=>"HMAC-SHA1", :timestamp=>"1417980667", :version=>"1.0"},
 @params=
  {:oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
   :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @uri=#<URI::HTTPS:0x007fb652fc02a0 URL:https://api.twitter.com/oauth/request_token>>
[3] pry(main)> twitter_auth.valid?
=> false
[4] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ cd ../../Gator
jason@The-Silverback-Bulldog: Gator $ ls
Gemfile		Procfile	README.rdoc	app		bin		config.ru	docs		log		tmp
Gemfile.lock	README.md	Rakefile	artwork		config		db		lib		public		vendor
jason@The-Silverback-Bulldog: Gator $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> UserAuthentications.first
NameError: uninitialized constant UserAuthentications
from (pry):1:in `<main>'
[2] pry(main)> UserAuthentication.first
  UserAuthentication Load (6.9ms)  SELECT  "user_authentications".* FROM "user_authentications"  ORDER BY "user_authentications"."id" ASC LIMIT 1
=> #<UserAuthentication:0x007ffe2e461b60
 id: 1,
 user_id: 1,
 authentication_provider_id: 3,
 uid: "_mnwaimRzj",
 token: "eb2647ae-b1a6-45f0-ac17-c6cbfa2369ed",
 token_expires_at: nil,
 params:
  {"provider"=>"linkedin",
   "uid"=>"_mnwaimRzj",
   "info"=>
    {"name"=>"Jason Wharff",
     "email"=>"fishermanswharff@mac.com",
     "nickname"=>"Jason Wharff",
     "first_name"=>"Jason",
     "last_name"=>"Wharff",
     "location"=>"Greater Boston Area, US",
     "description"=>"Web Development Immersive Student at General Assembly",
     "image"=>"https://media.licdn.com/mpr/mprx/0_-vl8EnKYtWK0rqmHt131EqCYrHQtKlmHKc50EqACfmtC7zMeYPTuXN5uOL6S1n7X1nPY5PfaMG2Y",
     "phone"=>nil,
     "headline"=>"Web Development Immersive Student at General Assembly",
     "industry"=>"Internet",
     "urls"=>{"public_profile"=>"https://www.linkedin.com/pub/jason-wharff/b/49b/4b3"}},
   "credentials"=>{"token"=>"eb2647ae-b1a6-45f0-ac17-c6cbfa2369ed", "secret"=>"4ee61389-5cfe-485d-a068-f87d784780e8"},
   "extra"=>
    {"access_token"=>
      #<OAuth::AccessToken:0x007ffe2ce79d48
       @consumer=
        #<OAuth::Consumer:0x007ffe2ce799d8
         @http=#<Net::HTTP api.linkedin.com:443 open=false>,
         @http_method=:post,
         @key="77434ddvspgteg",
         @options=
          {:signature_method=>"HMAC-SHA1",
           :request_token_path=>"/uas/oauth/requestToken",
           :authorize_path=>"/oauth/authorize",
           :access_token_path=>"/uas/oauth/accessToken",
           :proxy=>nil,
           :scheme=>:header,
           :http_method=>:post,
           :oauth_version=>"1.0",
           :site=>"https://api.linkedin.com",
           :authorize_url=>"https://www.linkedin.com/uas/oauth/authenticate"},
         @secret="7kF72eTDgTIakAf2",
         @uri=#<URI::HTTPS:0x007ffe2ce8a260 URL:https://api.linkedin.com>>,
       @params=
        {:oauth_token=>"eb2647ae-b1a6-45f0-ac17-c6cbfa2369ed",
         "oauth_token"=>"eb2647ae-b1a6-45f0-ac17-c6cbfa2369ed",
         :oauth_token_secret=>"4ee61389-5cfe-485d-a068-f87d784780e8",
         "oauth_token_secret"=>"4ee61389-5cfe-485d-a068-f87d784780e8",
         :oauth_expires_in=>"5183998",
         "oauth_expires_in"=>"5183998",
         :oauth_authorization_expires_in=>"5183998",
         "oauth_authorization_expires_in"=>"5183998"},
       @response=#<Net::HTTPOK 200 OK readbody=true>,
       @secret="4ee61389-5cfe-485d-a068-f87d784780e8",
       @token="eb2647ae-b1a6-45f0-ac17-c6cbfa2369ed">,
     "raw_info"=>
      {"emailAddress"=>"fishermanswharff@mac.com",
       "firstName"=>"Jason",
       "headline"=>"Web Development Immersive Student at General Assembly",
       "id"=>"_mnwaimRzj",
       "industry"=>"Internet",
       "lastName"=>"Wharff",
       "location"=>{"country"=>{"code"=>"us"}, "name"=>"Greater Boston Area"},
       "pictureUrl"=>"https://media.licdn.com/mpr/mprx/0_-vl8EnKYtWK0rqmHt131EqCYrHQtKlmHKc50EqACfmtC7zMeYPTuXN5uOL6S1n7X1nPY5PfaMG2Y",
       "publicProfileUrl"=>"https://www.linkedin.com/pub/jason-wharff/b/49b/4b3"}}},
 created_at: Tue, 21 Oct 2014 21:14:00 UTC +00:00,
 updated_at: Tue, 21 Oct 2014 21:14:00 UTC +00:00>
[3] pry(main)> UserAuthentication.where(provider: "twitter")
  UserAuthentication Load (0.8ms)  SELECT "user_authentications".* FROM "user_authentications" WHERE "user_authentications"."provider" = 'twitter'
PG::UndefinedColumn: ERROR:  column user_authentications.provider does not exist
LINE 1: ...hentications".* FROM "user_authentications" WHERE "user_auth...
                                                             ^
: SELECT "user_authentications".* FROM "user_authentications" WHERE "user_authentications"."provider" = 'twitter'
=> #<UserAuthentication::ActiveRecord_Relation:0x3fff19b2b97c>
[4] pry(main)> UserAuthentication.where(authentication_provider_id: 1)
  UserAuthentication Load (1.0ms)  SELECT "user_authentications".* FROM "user_authentications" WHERE "user_authentications"."authentication_provider_id" = $1  [["authentication_provider_id", 1]]
=> []
[5] pry(main)> UserAuthentication.where(authentication_provider_id: 2)
  UserAuthentication Load (0.4ms)  SELECT "user_authentications".* FROM "user_authentications" WHERE "user_authentications"."authentication_provider_id" = $1  [["authentication_provider_id", 2]]
=> [#<UserAuthentication:0x007ffe336d3b28
  id: 2,
  user_id: 1,
  authentication_provider_id: 2,
  uid: "20350433",
  token: "20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6",
  token_expires_at: nil,
  params:
   {"provider"=>"twitter",
    "uid"=>"20350433",
    "info"=>
     {"nickname"=>"jasonwharff",
      "name"=>"JasonWharff",
      "location"=>"boston",
      "image"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",
      "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",
      "urls"=>{"Website"=>"http://t.co/8oulbeIXyc", "Twitter"=>"https://twitter.com/jasonwharff"}},
    "credentials"=>{"token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
    "extra"=>
     {"access_token"=>
       #<OAuth::AccessToken:0x007ffe3371f7d0
        @consumer=
         #<OAuth::Consumer:0x007ffe3371f460
          @http=#<Net::HTTP api.twitter.com:443 open=false>,
          @http_method=:post,
          @key="Ja2vRzXC1C0KDw7uaNFbbWoZs",
          @options=
           {:signature_method=>"HMAC-SHA1",
            :request_token_path=>"/oauth/request_token",
            :authorize_path=>"/oauth/authenticate",
            :access_token_path=>"/oauth/access_token",
            :proxy=>nil,
            :scheme=>:header,
            :http_method=>:post,
            :oauth_version=>"1.0",
            :site=>"https://api.twitter.com"},
          @secret="i0vuPEUDNJtqB42n1K0eRAsMQ1NdUejARJFXeAJHps7Q2txIro",
          @uri=#<URI::HTTPS:0x007ffe3372ff90 URL:https://api.twitter.com>>,
        @params=
         {:oauth_token=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6",
          "oauth_token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6",
          :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
          "oauth_token_secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
          :user_id=>"20350433",
          "user_id"=>"20350433",
          :screen_name=>"jasonwharff",
          "screen_name"=>"jasonwharff"},
        @response=#<Net::HTTPOK 200 OK readbody=true>,
        @secret="HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
        @token="20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6">,
      "raw_info"=>
       {"id"=>20350433,
        "id_str"=>"20350433",
        "name"=>"JasonWharff",
        "screen_name"=>"jasonwharff",
        "location"=>"boston",
        "profile_location"=>nil,
        "description"=>"Designer, Developer, Artist, Professional Tinkerer, Constant Learner. I'm a monster that gobbles up life.",
        "url"=>"http://t.co/8oulbeIXyc",
        "entities"=>
         {"url"=>{"urls"=>[{"url"=>"http://t.co/8oulbeIXyc", "expanded_url"=>"http://www.jasonwharff.com", "display_url"=>"jasonwharff.com", "indices"=>[0, 22]}]},
          "description"=>{"urls"=>[]}},
        "protected"=>false,
        "followers_count"=>47,
        "friends_count"=>158,
        "listed_count"=>2,
        "created_at"=>"Sun Feb 08 04:16:04 +0000 2009",
        "favourites_count"=>163,
        "utc_offset"=>-18000,
        "time_zone"=>"Central Time (US & Canada)",
        "geo_enabled"=>true,
        "verified"=>false,
        "statuses_count"=>256,
        "lang"=>"en",
        "contributors_enabled"=>false,
        "is_translator"=>false,
        "is_translation_enabled"=>false,
        "profile_background_color"=>"0099B9",
        "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/452804052066136065/7jvc9NUD.jpeg",
        "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/452804052066136065/7jvc9NUD.jpeg",
        "profile_background_tile"=>true,
        "profile_image_url"=>"http://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",
        "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/421134326584336384/AJhsD37b_normal.jpeg",
        "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/20350433/1406759871",
        "profile_link_color"=>"0099B9",
        "profile_sidebar_border_color"=>"FFFFFF",
        "profile_sidebar_fill_color"=>"DDFFCC",
        "profile_text_color"=>"333333",
        "profile_use_background_image"=>false,
        "default_profile"=>false,
        "default_profile_image"=>false,
        "following"=>false,
        "follow_request_sent"=>false,
        "notifications"=>false}}},
  created_at: Tue, 21 Oct 2014 21:15:06 UTC +00:00,
  updated_at: Tue, 21 Oct 2014 21:15:06 UTC +00:00>]
[6] pry(main)> exit
jason@The-Silverback-Bulldog: Gator $ cd ../Gator2/gatorApi/
jason@The-Silverback-Bulldog: gatorApi $ ls
Gemfile		README.md	Rakefile	bin		config.ru	docs		log		spec
Gemfile.lock	README.rdoc	app		config		db		lib		public		tmp
jason@The-Silverback-Bulldog: gatorApi $ cd ../
jason@The-Silverback-Bulldog: Gator2 $ ls
gatorApi	simple_oauth	twitter_rest.rb	webapp
jason@The-Silverback-Bulldog: Gator2 $ rails c
Usage:
  rails new APP_PATH [options]

Options:
  -r, [--ruby=PATH]                                      # Path to the Ruby binary of your choice
                                                         # Default: /Users/jason/.rvm/rubies/ruby-2.1.2/bin/ruby
  -m, [--template=TEMPLATE]                              # Path to some application template (can be a filesystem path or URL)
      [--skip-gemfile], [--no-skip-gemfile]              # Don't create a Gemfile
  -B, [--skip-bundle], [--no-skip-bundle]                # Don't run bundle install
  -G, [--skip-git], [--no-skip-git]                      # Skip .gitignore file
      [--skip-keeps], [--no-skip-keeps]                  # Skip source control .keep files
  -O, [--skip-active-record], [--no-skip-active-record]  # Skip Active Record files
      [--skip-gems=one two three]                        # Skip the provided gems files
  -S, [--skip-sprockets], [--no-skip-sprockets]          # Skip Sprockets files
      [--skip-spring], [--no-skip-spring]                # Don't install Spring application preloader
  -d, [--database=DATABASE]                              # Preconfigure for selected database (options: mysql/oracle/postgresql/sqlite3/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
                                                         # Default: sqlite3
  -j, [--javascript=JAVASCRIPT]                          # Preconfigure for selected JavaScript library
                                                         # Default: jquery
  -J, [--skip-javascript], [--no-skip-javascript]        # Skip JavaScript files
      [--dev], [--no-dev]                                # Setup the application with Gemfile pointing to your Rails checkout
      [--edge], [--no-edge]                              # Setup the application with Gemfile pointing to Rails repository
  -T, [--skip-test-unit], [--no-skip-test-unit]          # Skip Test::Unit files
      [--rc=RC]                                          # Path to file containing extra configuration options for rails command
      [--no-rc], [--no-no-rc]                            # Skip loading of extra configuration options from .railsrc file

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Rails options:
  -h, [--help], [--no-help]        # Show this help message and quit
  -v, [--version], [--no-version]  # Show Rails version number and quit

Description:
    The 'rails new' command creates a new Rails application with a default
    directory structure and configuration at the path you specify.

    You can specify extra command-line arguments to be used every time
    'rails new' runs in the .railsrc configuration file in your home directory.

    Note that the arguments specified in the .railsrc file don't affect the
    defaults values shown above in this help message.

Example:
    rails new ~/Code/Ruby/weblog

    This generates a skeletal Rails installation in ~/Code/Ruby/weblog.
    See the README in the newly created application to get going.
jason@The-Silverback-Bulldog: Gator2 $ cd gatorApi/
jason@The-Silverback-Bulldog: gatorApi $ clear

jason@The-Silverback-Bulldog: gatorApi $ rails s
=> Booting Thin
=> Rails 4.2.0.beta2 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
A server is already running. Check /Users/jason/Documents/WebDevImmersive/Projects/Gator2/gatorApi/tmp/pids/server.pid.
Exiting
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> oauth = {
[1] pry(main)*   :oauth_callback => "http://127.0.0.1/users/auth/twitter/callback",   
[1] pry(main)*   :oauth_consumer_key => "Ja2vRzXC1C0KDw7uaNFbbWoZs",   
[1] pry(main)*   :oauth_token_secret => "HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"  
[1] pry(main)* }  
=> {:oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
 :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}
[2] pry(main)> twitter_auth = SimpleOAuth::Header.new(:post, 'https://api.twitter.com/oauth/request_token', oauth)
=> #<SimpleOAuth::Header:0x007fb652ed2140
 @method="POST",
 @options={:nonce=>"94c1c5da6c5555ebf3685dc1cd608346", :signature_method=>"HMAC-SHA1", :timestamp=>"1417981924", :version=>"1.0"},
 @params=
  {:oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
   :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @uri=#<URI::HTTPS:0x007fb652ed1ec0 URL:https://api.twitter.com/oauth/request_token>>
[3] pry(main)> twitter_auth.parse(twitter_auth)
NoMethodError: undefined method `parse' for #<SimpleOAuth::Header:0x007fb652ed2140>
from (pry):7:in `<main>'
[4] pry(main)> twitter_auth.valid?
=> false
[5] pry(main)> twitter_auth.signed_attributes
=> {:oauth_nonce=>"94c1c5da6c5555ebf3685dc1cd608346",
 :oauth_signature_method=>"HMAC-SHA1",
 :oauth_timestamp=>"1417981924",
 :oauth_version=>"1.0",
 :oauth_signature=>"cIO+bB4/OzdKcciRcibHnOussyA="}
[6] pry(main)> twitter_auth.options.merge(oauth)
=> {:nonce=>"94c1c5da6c5555ebf3685dc1cd608346",
 :signature_method=>"HMAC-SHA1",
 :timestamp=>"1417981924",
 :version=>"1.0",
 :oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
 :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
 :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"}
[7] pry(main)> twitter_auth.valid?
=> false
[8] pry(main)> uri = URI('https://api.twitter.com/oauth/request_token')
=> #<URI::HTTPS:0x007fb652e095b0 URL:https://api.twitter.com/oauth/request_token>
[9] pry(main)> http = Net::HTTP.new(uri.host,uri.port,initheader = {'Content-Type' =>'application/json', :use_ssl => uri.scheme == 'https'})
=> #<Net::HTTP api.twitter.com:443 open=false>
[10] pry(main)> req = Net::HTTP::Post.new uri
=> #<Net::HTTP::Post POST>
[11] pry(main)> req['OAuth'] = twitter_auth
=> #<SimpleOAuth::Header:0x007fb652ed2140
 @method="POST",
 @options={:nonce=>"94c1c5da6c5555ebf3685dc1cd608346", :signature_method=>"HMAC-SHA1", :timestamp=>"1417981924", :version=>"1.0"},
 @params=
  {:oauth_callback=>"http://127.0.0.1/users/auth/twitter/callback",
   :oauth_consumer_key=>"Ja2vRzXC1C0KDw7uaNFbbWoZs",
   :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @uri=#<URI::HTTPS:0x007fb652ed1ec0 URL:https://api.twitter.com/oauth/request_token>>
[12] pry(main)> http.request_post(req.uri,req,twitter_auth)
NoMethodError: undefined method `keys' for #<SimpleOAuth::Header:0x007fb652ed2140>
from /Users/jason/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/net/http/generic_request.rb:34:in `initialize'
[13] pry(main)> twitter_auth.to_json
=> "{\"method\":\"POST\",\"uri\":{\"scheme\":\"https\",\"user\":null,\"password\":null,\"host\":\"api.twitter.com\",\"port\":443,\"path\":\"/oauth/request_token\",\"query\":null,\"opaque\":null,\"registry\":null,\"fragment\":null,\"parser\":null},\"params\":{\"oauth_callback\":\"http://127.0.0.1/users/auth/twitter/callback\",\"oauth_consumer_key\":\"Ja2vRzXC1C0KDw7uaNFbbWoZs\",\"oauth_token_secret\":\"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur\"},\"options\":{\"nonce\":\"94c1c5da6c5555ebf3685dc1cd608346\",\"signature_method\":\"HMAC-SHA1\",\"timestamp\":\"1417981924\",\"version\":\"1.0\"}}"
[14] pry(main)> twitter_auth.options.to_json
=> "{\"nonce\":\"94c1c5da6c5555ebf3685dc1cd608346\",\"signature_method\":\"HMAC-SHA1\",\"timestamp\":\"1417981924\",\"version\":\"1.0\"}"
[15] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ bundle
Using rake 10.4.2
Using i18n 0.7.0.beta1
Using json 1.8.1
Using minitest 5.4.3
Using thread_safe 0.3.4
Using tzinfo 1.2.2
Using activesupport 4.2.0.beta2
Using builder 3.2.2
Using erubis 2.7.0
Using mini_portile 0.6.1
Using nokogiri 1.6.5
Using rails-deprecated_sanitizer 1.0.3
Using rails-dom-testing 1.0.5
Using loofah 2.0.1
Using rails-html-sanitizer 1.0.1
Using actionview 4.2.0.beta2
Using rack 1.6.0.beta2
Using rack-test 0.6.2
Using actionpack 4.2.0.beta2
Using globalid 0.3.0
Using activejob 4.2.0.beta2
Using mime-types 2.4.3
Using mail 2.6.3
Using actionmailer 4.2.0.beta2
Using activemodel 4.2.0.beta2
Using active_model_serializers 0.10.0.pre from git://github.com/rails-api/active_model_serializers.git (at master)
Using arel 6.0.0.beta2
Using activerecord 4.2.0.beta2
Using addressable 2.3.6
Using bcrypt 3.1.9
Using bcrypt-ruby 3.1.5
Using debug_inspector 0.0.2
Using binding_of_caller 0.7.2
Using buftok 0.2.0
Using uniform_notifier 1.6.2
Using bullet 4.14.0
Using columnize 0.8.9
Using debugger-linecache 1.2.0
Using slop 3.6.0
Using byebug 3.5.1
Using docile 1.1.5
Using multi_json 1.10.1
Using simplecov-html 0.8.0
Using simplecov 0.9.1
Using codeclimate-test-reporter 0.4.3
Using coderay 1.1.0
Using curb 0.8.6
Using daemons 1.1.9
Using diff-lcs 1.2.5
Using dotenv 1.0.2
Using dotenv-rails 1.0.2
Using equalizer 0.0.9
Using eventmachine 1.0.3
Using factory_girl 4.5.0
Using thor 0.19.1
Using railties 4.2.0.beta2
Using factory_girl_rails 4.5.0
Using faker 1.4.3
Using multipart-post 2.0.0
Using faraday 0.9.0
Using faraday_middleware 0.9.1
Using sax-machine 1.1.1
Using feedjira 1.5.0
Using hashie 3.3.2
Using hike 1.2.3
Using http_parser.rb 0.6.0
Using http 0.6.3
Using instagram 1.1.3
Using kgio 2.9.2
Using oauth 0.4.7
Using linkedin 1.0.0
Using memoizable 0.4.2
Using method_source 0.8.2
Using naught 1.0.0
Using pg 0.17.1
Using pry 0.10.1
Using pry-byebug 2.0.0
Using pry-rails 0.3.2
Using rack-cors 0.2.9
Using rack-ssl-enforcer 0.2.8
Using bundler 1.6.2
Using tilt 1.4.1
Using sprockets 2.12.3
Using sprockets-rails 3.0.0.beta1
Using rails 4.2.0.beta2
Using rails-api 0.3.1
Using rails_serve_static_assets 0.0.2
Using rails_stdout_logging 0.0.3
Using rails_12factor 0.0.3
Using raindrops 0.13.0
Using rspec-support 3.0.4
Using rspec-core 3.0.4
Using rspec-expectations 3.0.4
Using rspec-mocks 3.0.4
Using rspec-rails 3.0.2
Using simple_oauth 0.3.0
Using spring 1.2.0
Using thin 1.6.3
Using twitter 5.13.0
Using unicorn 4.8.3
Using web-console 2.0.0
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> OAuth
=> OAuth
[2] pry(main)> consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'],ENV['TWITTER_CONSUMER_SECRET'], {:site => "https://api.twitter.com", :scheme => :header })
=> #<OAuth::Consumer:0x007fad19443720
 @key="Ja2vRzXC1C0KDw7uaNFbbWoZs",
 @options=
  {:signature_method=>"HMAC-SHA1",
   :request_token_path=>"/oauth/request_token",
   :authorize_path=>"/oauth/authorize",
   :access_token_path=>"/oauth/access_token",
   :proxy=>nil,
   :scheme=>:header,
   :http_method=>:post,
   :oauth_version=>"1.0",
   :site=>"https://api.twitter.com"},
 @secret="i0vuPEUDNJtqB42n1K0eRAsMQ1NdUejARJFXeAJHps7Q2txIro">
[3] pry(main)> def prepare_access_token(oauth_token, oauth_token_secret)
[3] pry(main)*       consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header }[3] pry(main)*   consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header })   [3] pry(main)*        
[3] pry(main)*   # now create the access token object from passed values    
[3] pry(main)*   token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }    
[3] pry(main)*   access_token = OAuth::AccessToken.from_hash(consumer, token_hash )    
[3] pry(main)*    
[3] pry(main)*   return access_token    
[3] pry(main)* end  
=> :prepare_access_token
[4] pry(main)>  
[5] pry(main)> prepare_access_token(ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_SECRET'])
=> #<OAuth::AccessToken:0x007fad19768e00
 @consumer=
  #<OAuth::Consumer:0x007fad19769058
   @key="Ja2vRzXC1C0KDw7uaNFbbWoZs",
   @options=
    {:signature_method=>"HMAC-SHA1",
     :request_token_path=>"/oauth/request_token",
     :authorize_path=>"/oauth/authorize",
     :access_token_path=>"/oauth/access_token",
     :proxy=>nil,
     :scheme=>:header,
     :http_method=>:post,
     :oauth_version=>"1.0",
     :site=>"https://api.twitter.com"},
   @secret="i0vuPEUDNJtqB42n1K0eRAsMQ1NdUejARJFXeAJHps7Q2txIro">,
 @params={:oauth_token=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @secret="HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
 @token="20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6">
[6] pry(main)> access_token = prepare_access_token(ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_SECRET'])
=> #<OAuth::AccessToken:0x007fad1b59c408
 @consumer=
  #<OAuth::Consumer:0x007fad1b59c868
   @key="Ja2vRzXC1C0KDw7uaNFbbWoZs",
   @options=
    {:signature_method=>"HMAC-SHA1",
     :request_token_path=>"/oauth/request_token",
     :authorize_path=>"/oauth/authorize",
     :access_token_path=>"/oauth/access_token",
     :proxy=>nil,
     :scheme=>:header,
     :http_method=>:post,
     :oauth_version=>"1.0",
     :site=>"https://api.twitter.com"},
   @secret="i0vuPEUDNJtqB42n1K0eRAsMQ1NdUejARJFXeAJHps7Q2txIro">,
 @params={:oauth_token=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @secret="HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
 @token="20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6">
[7] pry(main)> response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
=> #<Net::HTTPOK 200 OK readbody=true>
[8] pry(main)> response.body
=> "[{\"created_at\":\"Sun Dec 07 20:11:50 +0000 2014\",\"id\":541686542482542593,\"id_str\":\"541686542482542593\",\"text\":\"RT @JayPharoah: Baby Yeezus #Hanhhhhh http:\\/\\/t.co\\/qNqzxRYWRX\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":22891326,\"id_str\":\"22891326\",\"name\":\"Jose Ramon Marquez\",\"screen_name\":\"joseramonmarmtz\",\"location\":\"Aguascalientes, Mexico\",\"profile_location\":null,\"description\":\"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.\",\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"expanded_url\":\"http:\\/\\/cokesnlfan.tumblr.com\",\"display_url\":\"cokesnlfan.tumblr.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1910,\"friends_count\":853,\"listed_count\":23,\"created_at\":\"Thu Mar 05 06:44:29 +0000 2009\",\"favourites_count\":18152,\"utc_offset\":-21600,\"time_zone\":\"Central Time (US & Canada)\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":97736,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"B2DFDA\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/22891326\\/1409898695\",\"profile_link_color\":\"93A644\",\"profile_sidebar_border_color\":\"000000\",\"profile_sidebar_fill_color\":\"C0DFEC\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweeted_status\":{\"created_at\":\"Sun Dec 07 18:54:45 +0000 2014\",\"id\":541667145357078528,\"id_str\":\"541667145357078528\",\"text\":\"Baby Yeezus #Hanhhhhh http:\\/\\/t.co\\/qNqzxRYWRX\",\"source\":\"\\u003ca href=\\\"http:\\/\\/www.facebook.com\\/twitter\\\" rel=\\\"nofollow\\\"\\u003eFacebook\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":25343191,\"id_str\":\"25343191\",\"name\":\"Jay Pharoah\",\"screen_name\":\"JayPharoah\",\"location\":\"In a studio working\",\"profile_location\":null,\"description\":\"http:\\/\\/t.co\\/gExE7TmkW3 http:\\/\\/t.co\\/1MeISDyozg\",\"url\":\"http:\\/\\/t.co\\/rasuClpO3k\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/rasuClpO3k\",\"expanded_url\":\"http:\\/\\/www.jaypharoah.com\",\"display_url\":\"jaypharoah.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/gExE7TmkW3\",\"expanded_url\":\"http:\\/\\/facebook.com\\/jaypharoah1\",\"display_url\":\"facebook.com\\/jaypharoah1\",\"indices\":[0,22]},{\"url\":\"http:\\/\\/t.co\\/1MeISDyozg\",\"expanded_url\":\"http:\\/\\/www.instagram.com\\/jaypharoah\",\"display_url\":\"instagram.com\\/jaypharoah\",\"indices\":[23,45]}]}},\"protected\":false,\"followers_count\":134367,\"friends_count\":1788,\"listed_count\":1065,\"created_at\":\"Thu Mar 19 17:26:23 +0000 2009\",\"favourites_count\":51,\"utc_offset\":-28800,\"time_zone\":\"Pacific Time (US & Canada)\",\"geo_enabled\":false,\"verified\":true,\"statuses_count\":11976,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"1B1F1A\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/833892245\\/ed7eedb7678ef81e2c1971ff784065d5.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/833892245\\/ed7eedb7678ef81e2c1971ff784065d5.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/378800000532194658\\/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/378800000532194658\\/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/25343191\\/1400553237\",\"profile_link_color\":\"5FEF2F\",\"profile_sidebar_border_color\":\"FFFFFF\",\"profile_sidebar_fill_color\":\"000000\",\"profile_text_color\":\"666666\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":false,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":5,\"favorite_count\":18,\"entities\":{\"hashtags\":[{\"text\":\"Hanhhhhh\",\"indices\":[12,21]}],\"symbols\":[],\"user_mentions\":[],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/qNqzxRYWRX\",\"expanded_url\":\"http:\\/\\/fb.me\\/7h9sQNefy\",\"display_url\":\"fb.me\\/7h9sQNefy\",\"indices\":[22,44]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},\"retweet_count\":5,\"favorite_count\":0,\"entities\":{\"hashtags\":[{\"text\":\"Hanhhhhh\",\"indices\":[28,37]}],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"JayPharoah\",\"name\":\"Jay Pharoah\",\"id\":25343191,\"id_str\":\"25343191\",\"indices\":[3,14]}],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/qNqzxRYWRX\",\"expanded_url\":\"http:\\/\\/fb.me\\/7h9sQNefy\",\"display_url\":\"fb.me\\/7h9sQNefy\",\"indices\":[38,60]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:11:21 +0000 2014\",\"id\":541686420826767361,\"id_str\":\"541686420826767361\",\"text\":\"RT @NBCMarryMe: Staging a protest, running from a bear, or woke up like this? Find out on #MarryMe this Tuesday at 9\\/8c on @NBC! http:\\/\\/t.c\\u2026\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":22891326,\"id_str\":\"22891326\",\"name\":\"Jose Ramon Marquez\",\"screen_name\":\"joseramonmarmtz\",\"location\":\"Aguascalientes, Mexico\",\"profile_location\":null,\"description\":\"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.\",\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"expanded_url\":\"http:\\/\\/cokesnlfan.tumblr.com\",\"display_url\":\"cokesnlfan.tumblr.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1910,\"friends_count\":853,\"listed_count\":23,\"created_at\":\"Thu Mar 05 06:44:29 +0000 2009\",\"favourit...skipping...
=> "[{\"created_at\":\"Sun Dec 07 20:11:50 +0000 2014\",\"id\":541686542482542593,\"id_str\":\"541686542482542593\",\"text\":\"RT @JayPharoah: Baby Yeezus #Hanhhhhh http:\\/\\/t.co\\/qNqzxRYWRX\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\=> "[{\"created_at\":\"Sun Dec 07 20:11:50 +0000 2014\",\"id\":541686542482542593,\"id_str\":\"541686542482542593\",\"text\":\"RT @JayPharoah: Baby Yeezus #Hanhhhhh http:\
\/\\/t.co\\/qNqzxRYWRX\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":22891326,\"id_str\":\"22891326\",\"name\":\"Jose Ramon Marquez\",\"screen_name\":\"joseramonmarmtz\",\"location\":\"Aguascalientes, Mexico\",\"profile_location\":null,\"description\":\"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.\",\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"expanded_url\":\"http:\\/\\/cokesnlfan.tumblr.com\",\"display_url\":\"cokesnlfan.tumblr.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1910,\"friends_count\":853,\"listed_count\":23,\"created_at\":\"Thu Mar 05 06:44:29 +0000 2009\",\"favourites_count\":18152,\"utc_offset\":-21600,\"time_zone\":\"Central Time (US & Canada)\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":97736,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"B2DFDA\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/22891326\\/1409898695\",\"profile_link_color\":\"93A644\",\"profile_sidebar_border_color\":\"000000\",\"profile_sidebar_fill_color\":\"C0DFEC\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweeted_status\":{\"created_at\":\"Sun Dec 07 18:54:45 +0000 2014\",\"id\":541667145357078528,\"id_str\":\"541667145357078528\",\"text\":\"Baby Yeezus #Hanhhhhh http:\\/\\/t.co\\/qNqzxRYWRX\",\"source\":\"\\u003ca href=\\\"http:\\/\\/www.facebook.com\\/twitter\\\" rel=\\\"nofollow\\\"\\u003eFacebook\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":25343191,\"id_str\":\"25343191\",\"name\":\"Jay Pharoah\",\"screen_name\":\"JayPharoah\",\"location\":\"In a studio working\",\"profile_location\":null,\"description\":\"http:\\/\\/t.co\\/gExE7TmkW3 http:\\/\\/t.co\\/1MeISDyozg\",\"url\":\"http:\\/\\/t.co\\/rasuClpO3k\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/rasuClpO3k\",\"expanded_url\":\"http:\\/\\/www.jaypharoah.com\",\"display_url\":\"jaypharoah.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/gExE7TmkW3\",\"expanded_url\":\"http:\\/\\/facebook.com\\/jaypharoah1\",\"display_url\":\"facebook.com\\/jaypharoah1\",\"indices\":[0,22]},{\"url\":\"http:\\/\\/t.co\\/1MeISDyozg\",\"expanded_url\":\"http:\\/\\/www.instagram.com\\/jaypharoah\",\"display_url\":\"instagram.com\\/jaypharoah\",\"indices\":[23,45]}]}},\"protected\":false,\"followers_count\":134367,\"friends_count\":1788,\"listed_count\":1065,\"created_at\":\"Thu Mar 19 17:26:23 +0000 2009\",\"favourites_count\":51,\"utc_offset\":-28800,\"time_zone\":\"Pacific Time (US & Canada)\",\"geo_enabled\":false,\"verified\":true,\"statuses_count\":11976,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"1B1F1A\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/833892245\\/ed7eedb7678ef81e2c1971ff784065d5.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/833892245\\/ed7eedb7678ef81e2c1971ff784065d5.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/378800000532194658\\/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/378800000532194658\\/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/25343191\\/1400553237\",\"profile_link_color\":\"5FEF2F\",\"profile_sidebar_border_color\":\"FFFFFF\",\"profile_sidebar_fill_color\":\"000000\",\"profile_text_color\":\"666666\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":false,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":5,\"favorite_count\":18,\"entities\":{\"hashtags\":[{\"text\":\"Hanhhhhh\",\"indices\":[12,21]}],\"symbols\":[],\"user_mentions\":[],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/qNqzxRYWRX\",\"expanded_url\":\"http:\\/\\/fb.me\\/7h9sQNefy\",\"display_url\":\"fb.me\\/7h9sQNefy\",\"indices\":[22,44]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},\"retweet_count\":5,\"favorite_count\":0,\"entities\":{\"hashtags\":[{\"text\":\"Hanhhhhh\",\"indices\":[28,37]}],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"JayPharoah\",\"name\":\"Jay Pharoah\",\"id\":25343191,\"id_str\":\"25343191\",\"indices\":[3,14]}],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/qNqzxRYWRX\",\"expanded_url\":\"http:\\/\\/fb.me\\/7h9sQNefy\",\"display_url\":\"fb.me\\/7h9sQNefy\",\"indices\":[38,60]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:11:21 +0000 2014\",\"id\":541686420826767361,\"id_str\":\"541686420826767361\",\"text\":\"RT @NBCMarryMe: Staging a protest, running from a bear, or woke up like this? Find out on #MarryMe this Tuesday at 9\\/8c on @NBC! http:\\/\\/t.c\\u2026\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":22891326,\"id_str\":\"22891326\",\"name\":\"Jose Ramon Marquez\",\"screen_name\":\"joseramonmarmtz\",\"location\":\"Aguascalientes, Mexico\",\"profile_location\":null,\"description\":\"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.\",\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"expanded_url\":\"http:\\/\\/cokesnlfan.tumblr.com\",\"display_url\":\"cokesnlfan.tumblr.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1910,\"friends_count\":853,\"listed_count\":23,\"created_at\":\"Thu Mar 05 06:44:29 +0000 2009\",\"favourites_count\":18152,\"utc_offset\":-21600,\"time_zone\":\"Central Time (US & Canada)\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":97736,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"B2DFDA\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/22891326\\/1409898695\",\"profile_link_color\":\"93A644\",\"profile_sidebar_border_color\":\"000000\",\"profile_sidebar_fill_color\":\"C0DFEC\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweeted_status\":{\"created_at\":\"Sun Dec 07 19:00:59 +0000 2014\",\"id\":541668713712594945,\"id_str\":\"541668713712594945\",\"text\":\"Staging a protest, running from a bear, or woke up like this? Find out on #MarryMe this Tuesday at 9\\/8c on @NBC! http:\\/\\/t.co\\/ap8oHUvjbw\",\"source\":\"\\u003ca href=\\\"http:\\/\\/www.hootsuite.com\\\" rel=\\\"nofollow\\\"\\u003eHootsuite\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":2396412661,\"id_str\":\"2396412661\",\"name\":\"Marry Me\",\"screen_name\":\"NBCMarryMe\",\"location\":\"NBC\",\"profile_location\":null,\"description\":\"The official Twitter handle for #MarryMe. Tuesdays at 9\\/8c on @NBC!\",\"url\":\"http:\\/\\/t.co\\/9JcfmpX4ud\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9JcfmpX4ud\",\"expanded_url\":\"http:\\/\\/www.nbc.com\\/marry-me\",\"display_url\":\"nbc.com\\/marry-me\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":11742,\"friends_count\":181,\"listed_count\":65,\"created_at\":\"Tue Mar 18 15:36:47 +0000 2014\",\"favourites_count\":239,\"utc_offset\":-18000,\"time_zone\":\"Eastern Time (US & Canada)\",\"geo_enabled\":false,\"verified\":true,\"statuses_count\":1165,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"C0DEED\",\"profile_background_image_url\":\"http:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",\"profile_background_image_url_https\":\"https:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",\"profile_background_tile\":false,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/509329514304786433\\/FB7unVxJ_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/509329514304786433\\/FB7unVxJ_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/2396412661\\/1410268653\",\"profile_link_color\":\"0084B4\",\"profile_sidebar_border_color\":\"C0DEED\",\"profile_sidebar_fill_color\":\"DDEEF6\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":true,\"default_profile_image\":false,\"following\":false,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":1,\"favorite_count\":5,\"entities\":{\"hashtags\":[{\"text\":\"MarryMe\",\"indices\":[74,82]}],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"nbc\",\"name\":\"NBC\",\"id\":26585095,\"id_str\":\"26585095\",\"indices\":[107,111]}],\"urls\":[],\"media\":[{\"id\":541668713209286656,\"id_str\":\"541668713209286656\",\"indices\":[113,135],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"url\":\"http:\\/\\/t.co\\/ap8oHUvjbw\",\"display_url\":\"pic.twitter.com\\/ap8oHUvjbw\",\"expanded_url\":\"http:\\/\\/twitter.com\\/NBCMarryMe\\/status\\/541668713712594945\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1000,\"h\":500,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":300,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":170,\"resize\":\"fit\"}}}]},\"extended_entities\":{\"media\":[{\"id\":541668713209286656,\"id_str\":\"541668713209286656\",\"indices\":[113,135],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"url\":\"http:\\/\\/t.co\\/ap8oHUvjbw\",\"display_url\":\"pic.twitter.com\\/ap8oHUvjbw\",\"expanded_url\":\"http:\\/\\/twitter.com\\/NBCMarryMe\\/status\\/541668713712594945\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1000,\"h\":500,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":300,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":170,\"resize\":\"fit\"}}}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},\"retweet_count\":1,\"favorite_count\":0,\"entities\":{\"hashtags\":[{\"text\":\"MarryMe\",\"indices\":[90,98]}],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"NBCMarryMe\",\"name\":\"Marry Me\",\"id\":2396412661,\"id_str\":\"2396412661\",\"indices\":[3,14]},{\"screen_name\":\"nbc\",\"name\":\"NBC\",\"id\":26585095,\"id_str\":\"26585095\",\"indices\":[123,127]}],\"urls\":[],\"media\":[{\"id\":541668713209286656,\"id_str\":\"541668713209286656\",\"indices\":[139,140],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"url\":\"http:\\/\\/t.co\\/ap8oHUvjbw\",\"display_url\":\"pic.twitter.com\\/ap8oHUvjbw\",\"expanded_url\":\"http:\\/\\/twitter.com\\/NBCMarryMe\\/status\\/541668713712594945\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1000,\"h\":500,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":300,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":170,\"resize\":\"fit\"}},\"source_status_id\":541668713712594945,\"source_status_id_str\":\"541668713712594945\",\"source_user_id\":2396412661,\"source_user_id_str\":\"2396412661\"}]},\"extended_entities\":{\"media\":[{\"id\":541668713209286656,\"id_str\":\"541668713209286656\",\"indices\":[139,140],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4Rk0yTIUAAYIFu.jpg\",\"url\":\"http:\\/\\/t.co\\/ap8oHUvjbw\",\"display_url\":\"pic.twitter.com\\/ap8oHUvjbw\",\"expanded_url\":\"http:\\/\\/twitter.com\\/NBCMarryMe\\/status\\/541668713712594945\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1000,\"h\":500,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":300,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":170,\"resize\":\"fit\"}},\"source_status_id\":541668713712594945,\"source_status_id_str\":\"541668713712594945\",\"source_user_id\":2396412661,\"source_user_id_str\":\"2396412661\"}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:10:20 +0000 2014\",\"id\":541686166849093632,\"id_str\":\"541686166849093632\",\"text\":\"We need to stop thinking that career development and advancement are synonymous http:\\/\\/t.co\\/xPW7p1wxuy\",\"source\":\"\\u003ca href=\\\"http:\\/\\/www.socialflow.com\\\" rel=\\\"nofollow\\\"\\u003eSocialFlow\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":2735591,\"id_str\":\"2735591\",\"name\":\"Fast Company\",\"screen_name\":\"FastCompany\",\"location\":\"New York, NY\",\"profile_location\":null,\"description\":\"Official Twitter feed for the Fast Company business media brand;  inspiring readers to think beyond traditional boundaries & create the future of business.\",\"url\":\"http:\\/\\/t.co\\/GBtvUq9rZp\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/GBtvUq9rZp\",\"expanded_url\":\"http:\\/\\/www.fastcompany.com\",\"display_url\":\"fastcompany.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1609047,\"friends_count\":3930,\"listed_count\":37240,\"created_at\":\"Wed Mar 28 22:39:21 +0000 2007\",\"favourites_count\":1665,\"utc_offset\":-18000,\"time_zone\":\"Eastern Time (US & Canada)\",\"geo_enabled\":false,\"verified\":true,\"statuses_count\":93788,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":true,\"profile_background_color\":\"FFFFFF\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/425029708\\/2048x1600-fc-twitter-backgrd.png\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/425029708\\/2048x1600-fc-twitter-backgrd.png\",\"profile_background_tile\":false,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/435840321952288770\\/IaWfR33b_normal.png\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/435840321952288770\\/IaWfR33b_normal.png\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/2735591\\/1416233672\",\"profile_link_color\":\"9AB2B4\",\"profile_sidebar_border_color\":\"5A5A5A\",\"profile_sidebar_fill_color\":\"CCCCCC\",\"profile_text_color\":\"000000\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":3,\"favorite_count\":12,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/xPW7p1wxuy\",\"expanded_url\":\"http:\\/\\/f-st.co\\/udV6WTy\",\"display_url\":\"f-st.co\\/udV6WTy\",\"indices\":[80,102]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:10:08 +0000 2014\",\"id\":541686114965540865,\"id_str\":\"541686114965540865\",\"text\":\"David Sedaris went all-out with his outfit choice: https:\\/\\/t.co\\/z4HnCGTxsJ http:\\/\\/t.co\\/Qq3jb7ernd\",\"source\":\"\\u003ca href=\\\"http:\\/\\/www.hootsuite.com\\\" rel=\\\"nofollow\\\"\\u003eHootsuite\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":19777398,\"id_str\":\"19777398\",\"name\":\"Fallon Tonight\",\"screen_name\":\"FallonTonight\",\"location\":\"Weeknights 11:35\\/10:35c\",\"profile_location\":null,\"description\":\"The official Twitter for Tonight Show Starring Jimmy Fallon on @NBC.\\n   (Tweets by: @marinarachael @christinefriar @thatsso_rachael @NoahGeb) #FallonTonight\",\"url\":\"http:\\/\\/t.co\\/fgp5RYqr3T\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/fgp5RYqr3T\",\"expanded_url\":\"http:\\/\\/www.tonightshow.com\",\"display_url\":\"tonightshow.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1860863,\"friends_count\":14761,\"listed_count\":6984,\"created_at\":\"Fri Jan 30 17:26:46 +0000 2009\",\"favourites_count\":57272,\"utc_offset\":-21600,\"time_zone\":\"Central Time (US & Canada)\",\"geo_enabled\":false,\"verified\":true,\"statuses_count\":29045,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"03253E\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/432922341345988609\\/3BSxlqQE.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/432922341345988609\\/3BSxlqQE.jpeg\",\"profile_background_tile\":false,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/432921867259613184\\/q89H1EeV_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/432921867259613184\\/q89H1EeV_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/19777398\\/1401723954\",\"profile_link_color\":\"0084B4\",\"profile_sidebar_border_color\":\"FFFFFF\",\"profile_sidebar_fill_color\":\"DDFFCC\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":7,\"favorite_count\":25,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[],\"urls\":[{\"url\":\"https:\\/\\/t.co\\/z4HnCGTxsJ\",\"expanded_url\":\"https:\\/\\/www.youtube.com\\/watch?v=XXbmbqfJDMI&list=UU8-Th83bH_thdKZDJCrn88g\",\"display_url\":\"youtube.com\\/watch?v=XXbmbq\\u2026\",\"indices\":[51,74]},{\"url\":\"http:\\/\\/t.co\\/Qq3jb7ernd\",\"expanded_url\":\"http:\\/\\/twitter.com\\/FallonTonight\\/status\\/541686114965540865\\/photo\\/1\",\"display_url\":\"pic.twitter.com\\/Qq3jb7ernd\",\"indices\":[75,97]}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:10:01 +0000 2014\",\"id\":541686084438990850,\"id_str\":\"541686084438990850\",\"text\":\"Up to 50% off prints when you order a custom design! Visit http:\\/\\/t.co\\/hbRQbo5BxR 34 http:\\/\\/t.co\\/Rm1z16mNGd\",\"source\":\"\\u003ca href=\\\"http:\\/\\/tweetadder.com\\\" rel=\\\"nofollow\\\"\\u003eTweetAdder v4\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":2239497745,\"id_str\":\"2239497745\",\"name\":\"SiegePrints.com\",\"screen_name\":\"AmberG1301\",\"location\":\"\",\"profile_location\":null,\"description\":\"50% Off business card prints when you order a custom design. Learn more at http:\\/\\/t.co\\/31K65WMMy2\",\"url\":\"http:\\/\\/t.co\\/KB2edu5ZCS\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/KB2edu5ZCS\",\"expanded_url\":\"http:\\/\\/www.siegeprints.com\",\"display_url\":\"siegeprints.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/31K65WMMy2\",\"expanded_url\":\"http:\\/\\/www.siegeprints.com\\/Specials.html\",\"display_url\":\"siegeprints.com\\/Specials.html\",\"indices\":[75,97]}]}},\"protected\":false,\"followers_count\":17090,\"friends_count\":13000,\"listed_count\":30,\"created_at\":\"Tue Dec 10 17:08:48 +0000 2013\",\"favourites_count\":1,\"utc_offset\":-25200,\"time_zone\":\"Arizona\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":15003,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"C0DEED\",\"profile_background_image_url\":\"http:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",\"profile_background_image_url_https\":\"https:\\/\\/abs.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",\"profile_background_tile\":false,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/469643964295827456\\/m_NwVsW4_normal.png\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/469643964295827456\\/m_NwVsW4_normal.png\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/2239497745\\/1415848766\",\"profile_link_color\":\"0084B4\",\"profile_sidebar_border_color\":\"C0DEED\",\"profile_sidebar_fill_color\":\"DDEEF6\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":true,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[],\"urls\":[{\"url\":\"http:\\/\\/t.co\\/hbRQbo5BxR\",\"expanded_url\":\"http:\\/\\/www.siegeprints.com\\/specials.html\",\"display_url\":\"siegeprints.com\\/specials.html\",\"indices\":[59,81]}],\"media\":[{\"id\":541686084195729408,\"id_str\":\"541686084195729408\",\"indices\":[85,107],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4R0n6RCQAAhUJW.png\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4R0n6RCQAAhUJW.png\",\"url\":\"http:\\/\\/t.co\\/Rm1z16mNGd\",\"display_url\":\"pic.twitter.com\\/Rm1z16mNGd\",\"expanded_url\":\"http:\\/\\/twitter.com\\/AmberG1301\\/status\\/541686084438990850\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":535,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":314,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":177,\"resize\":\"fit\"}}}]},\"extended_entities\":{\"media\":[{\"id\":541686084195729408,\"id_str\":\"541686084195729408\",\"indices\":[85,107],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/B4R0n6RCQAAhUJW.png\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/B4R0n6RCQAAhUJW.png\",\"url\":\"http:\\/\\/t.co\\/Rm1z16mNGd\",\"display_url\":\"pic.twitter.com\\/Rm1z16mNGd\",\"expanded_url\":\"http:\\/\\/twitter.com\\/AmberG1301\\/status\\/541686084438990850\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":535,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":314,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":177,\"resize\":\"fit\"}}}]},\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"en\"},{\"created_at\":\"Sun Dec 07 20:09:55 +0000 2014\",\"id\":541686060095651840,\"id_str\":\"541686060095651840\",\"text\":\"RT @StereoreyMX: How does it feel to be without home, like a complete unknown, like a rolling stone? \\u266b\",\"source\":\"\\u003ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/ipad\\\" rel=\\\"nofollow\\\"\\u003eTwitter for iPad\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":22891326,\"id_str\":\"22891326\",\"name\":\"Jose Ramon Marquez\",\"screen_name\":\"joseramonmarmtz\",\"location\":\"Aguascalientes, Mexico\",\"profile_location\":null,\"description\":\"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.\",\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"http:\\/\\/t.co\\/9lh90BLhAU\",\"expanded_url\":\"http:\\/\\/cokesnlfan.tumblr.com\",\"display_url\":\"cokesnlfan.tumblr.com\",\"indices\":[0,22]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":1910,\"friends_count\":853,\"listed_count\":23,\"created_at\":\"Thu Mar 05 06:44:29 +0000 2009\",\"favourites_count\":18152,\"utc_offset\":-21600,\"time_zone\":\"Central Time (US & Canada)\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":97736,\"lang\":\"en\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"B2DFDA\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_background_images\\/539988582807519232\\/rNRMfGGw.jpeg\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/488924614735589377\\/DnK0Xzn9_normal.jpeg\",\"profile_banner_url\":\"https:\\/\\/pbs.twimg.com\\/profile_banners\\/22891326\\/1409898695\",\"profile_link_color\":\"93A644\",\"profile_sidebar_border_color\":\"000000\",\"profile_sidebar_fill_color\":\"C0DFEC\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":true,\"follow_request_sent\":false,\"notifications\":false},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweeted_status\":{\"created_at\":\"Sun Dec 07 19:33:13 +0000 2014\",\"id\":541676825198354432,\"id_str\":\"541676825198354432\",\"text\":\"How does it feel to be without home, like a complete unknown, like a rolling stone? \\u266b\",\"source\":\"\\u003ca href=\\\"https:\\/\\/about.twitter.com\\/products\\/tweetdeck\\\" rel=\\\"nofollow\\\"\\u003eTweetDeck\\u003c\\/a\\u003e\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":2280959780,\"id_str\":\"2280959780\",\"name\":\"Stereorey\",\"screen_name\":\"StereoreyMX\",\"location\":\"\",\"profile_location\":null,\"description\":\"\",\"url\":null,\"entities\":{\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":12997,\"friends_count\":964,\"listed_count\":5,\"created_at\":\"Tue Jan 07 17:53:18 +0000 2014\",\"favourites_count\":4,\"utc_offset\":null,\"time_zone\":null,\"geo_enabled\":false,\"verified\":false,\"statuses_count\":447,\"lang\":\"es\",\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"000000\",\"profile_background_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_background_images\\/456172723626971[9] pry(main)> exit
jason@The-Silverback-Bulldog: gatorApi $ curl -I https://api.twitter.com/oauth/authenticate?oauth_token=20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6
HTTP/1.1 403 Forbidden
cache-control: no-cache, no-store, must-revalidate, pre-check=0, post-check=0
content-length: 3132
content-security-policy: default-src https:; connect-src https:; font-src https: data:; frame-src https:; img-src https: data:; media-src https:; object-src https:; script-src 'unsafe-inline' 'unsafe-eval' https:; style-src 'unsafe-inline' https:; report-uri https://twitter.com/i/csp_report?a=NVXW433SMFUWY%3D%3D%3D&ro=false;
content-type: text/html; charset=utf-8
date: Sun, 07 Dec 2014 20:15:33 UTC
expires: Tue, 31 Mar 1981 05:00:00 GMT
last-modified: Sun, 07 Dec 2014 20:15:33 GMT
pragma: no-cache
server: tsa_b
set-cookie: _twitter_sess=BAh7CToMY3NyZl9pZCIlNWY3NmYzNjIyZTgwNjlkN2EwMTk2NDc5OTA3Yjcy%250AMDQiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh%250Ac2h7AAY6CkB1c2VkewA6B2lkIiUyMTBjNzdiODJjMDYxMWMwOTBjOTRhOTkw%250AZWZkYWYzODoPY3JlYXRlZF9hdGwrCPCSZCZKAQ%253D%253D--6e7876f73679cc1a1d00ba94e6dbc6233465225c; domain=.twitter.com; path=/; secure; HttpOnly
set-cookie: guest_id=v1%3A141798333298320292; Domain=.twitter.com; Path=/; Expires=Tue, 06-Dec-2016 20:15:33 UTC
status: 403 Forbidden
strict-transport-security: max-age=631138519
vary: Accept-Encoding
x-connection-hash: 2a426b67649878196e1378a93df8de16
x-content-type-options: nosniff
x-frame-options: SAMEORIGIN
x-mid: 47755d069e2f31b7f1250f723a52377007cf60c0
x-response-time: 171
x-runtime: 0.01347
x-transaction: d773755c079540c4
x-ua-compatible: IE=edge,chrome=1
x-xss-protection: 1; mode=block

jason@The-Silverback-Bulldog: gatorApi $ response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
-bash: syntax error near unexpected token `('
jason@The-Silverback-Bulldog: gatorApi $ response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
-bash: syntax error near unexpected token `('
jason@The-Silverback-Bulldog: gatorApi $ rails c
Loading development environment (Rails 4.2.0.beta2)
[1] pry(main)> def prepare_access_token(oauth_token, oauth_token_secret)
[1] pry(main)*       consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header }[1] pry(main)*   consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header })   [1] pry(main)*        
[1] pry(main)*   # now create the access token object from passed values    
[1] pry(main)*   token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }    
[1] pry(main)*   access_token = OAuth::AccessToken.from_hash(consumer, token_hash )    
[1] pry(main)*    
[1] pry(main)*   return access_token    
[1] pry(main)* end  
=> :prepare_access_token
[2] pry(main)> access_token = prepare_access_token(ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_SECRET'])
=> #<OAuth::AccessToken:0x007fad20be0d78
 @consumer=
  #<OAuth::Consumer:0x007fad20be0ee0
   @key="Ja2vRzXC1C0KDw7uaNFbbWoZs",
   @options=
    {:signature_method=>"HMAC-SHA1",
     :request_token_path=>"/oauth/request_token",
     :authorize_path=>"/oauth/authorize",
     :access_token_path=>"/oauth/access_token",
     :proxy=>nil,
     :scheme=>:header,
     :http_method=>:post,
     :oauth_version=>"1.0",
     :site=>"https://api.twitter.com"},
   @secret="i0vuPEUDNJtqB42n1K0eRAsMQ1NdUejARJFXeAJHps7Q2txIro">,
 @params={:oauth_token=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", :oauth_token_secret=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur"},
 @secret="HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur",
 @token="20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6">
[3] pry(main)> access_token.request(:get, 'https://api.twitter.com/1.1/statuses/home_timeline.json')
=> #<Net::HTTPOK 200 OK readbody=true>
[4] pry(main)> res = access_token.request(:get, 'https://api.twitter.com/1.1/statuses/home_timeline.json')
=> #<Net::HTTPOK 200 OK readbody=true>
[5] pry(main)> JSON.parse(res.body)
=> [{"created_at"=>"Sun Dec 07 20:26:20 +0000 2014",
  "id"=>541690193724854273,
  "id_str"=>"541690193724854273",
  "text"=>"9 GIFs that explain responsive design brilliantly http://t.co/IPxJmFIt8O http://t.co/3uHhTYdDkv",
  "source"=>"<a href=\"http://www.socialflow.com\" rel=\"nofollow\">SocialFlow</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2735591,
    "id_str"=>"2735591",
    "name"=>"Fast Company",
    "screen_name"=>"FastCompany",
    "location"=>"New York, NY",
    "profile_location"=>nil,
    "description"=>
     "Official Twitter feed for the Fast Company business media brand;  inspiring readers to think beyond traditional boundaries & create the future of business.",
    "url"=>"http://t.co/GBtvUq9rZp",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/GBtvUq9rZp", "expanded_url"=>"http://www.fastcompany.com", "display_url"=>"fastcompany.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1609050,
    "friends_count"=>3930,
    "listed_count"=>37240,
    "created_at"=>"Wed Mar 28 22:39:21 +0000 2007",
    "favourites_count"=>1665,
    "utc_offset"=>-18000,
    "time_zone"=>"Eastern Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>93789,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>true,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/425029708/2048x1600-fc-twitter-backgrd.png",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/425029708/2048x1600-fc-twitter-backgrd.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/435840321952288770/IaWfR33b_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/435840321952288770/IaWfR33b_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2735591/1416233672",
    "profile_link_color"=>"9AB2B4",
    "profile_sidebar_border_color"=>"5A5A5A",
    "profile_sidebar_fill_color"=>"CCCCCC",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>12,
  "favorite_count"=>12,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>[{"url"=>"http://t.co/IPxJmFIt8O", "expanded_url"=>"http://f-st.co/7saK9uh", "display_url"=>"f-st.co/7saK9uh", "indices"=>[50, 72]}],
    "media"=>
     [{"id"=>541690193678704640,
       "id_str"=>"541690193678704640",
       "indices"=>[73, 95],
       "media_url"=>"http://pbs.twimg.com/media/B4R4XHSIIAArysh.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R4XHSIIAArysh.png",
       "url"=>"http://t.co/3uHhTYdDkv",
       "display_url"=>"pic.twitter.com/3uHhTYdDkv",
       "expanded_url"=>"http://twitter.com/FastCompany/status/541690193724854273/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>798, "h"=>398, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>299, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>169, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541690193678704640,
       "id_str"=>"541690193678704640",
       "indices"=>[73, 95],
       "media_url"=>"http://pbs.twimg.com/media/B4R4XHSIIAArysh.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R4XHSIIAArysh.png",
       "url"=>"http://t.co/3uHhTYdDkv",
       "display_url"=>"pic.twitter.com/3uHhTYdDkv",
       "expanded_url"=>"http://twitter.com/FastCompany/status/541690193724854273/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>798, "h"=>398, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>299, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>169, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:25:33 +0000 2014",
  "id"=>541689993350369280,
  "id_str"=>"541689993350369280",
  "text"=>"A supercut of Jimmy Fallon laughing and clapping [video] http://t.co/ts9zRmAgUm http://t.co/Lw5oFDEAMf",
  "source"=>"<a href=\"http://alltop.com/\" rel=\"nofollow\">Alltop Tweets</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>8453452,
    "id_str"=>"8453452",
    "name"=>"Guy Kawasaki",
    "screen_name"=>"GuyKawasaki",
    "location"=>"Silicon Valley, California",
    "profile_location"=>nil,
    "description"=>"Mantra: I empower people. Chief evangelist of Canva. https://t.co/u8Ec658pDq. Author of twelve books. Former chief evangelist of Apple.",
    "url"=>"http://t.co/m4UXWPrgo8",
    "entities"=>
     {"url"=>
       {"urls"=>
         [{"url"=>"http://t.co/m4UXWPrgo8", "expanded_url"=>"http://www.amazon.com/dp/1591848075", "display_url"=>"amazon.com/dp/1591848075", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[{"url"=>"https://t.co/u8Ec658pDq", "expanded_url"=>"https://www.canva.com/", "display_url"=>"canva.com", "indices"=>[53, 76]}]}},
    "protected"=>false,
    "followers_count"=>1435251,
    "friends_count"=>107345,
    "listed_count"=>37040,
    "created_at"=>"Mon Aug 27 03:36:53 +0000 2007",
    "favourites_count"=>829,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>133864,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"131516",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/378800000152022481/fO0TSkrT.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/378800000152022481/fO0TSkrT.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/532396480242266113/W_YUvkCK_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/532396480242266113/W_YUvkCK_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/8453452/1417478012",
    "profile_link_color"=>"DD2E44",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"FCFCFC",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>false,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>2,
  "favorite_count"=>1,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/ts9zRmAgUm",
       "expanded_url"=>"http://holykaw.alltop.com/supercut-jimmy-fallon-laughing-clapping-video?gk3",
       "display_url"=>"holykaw.alltop.com/supercut-jimmy…",
       "indices"=>[57, 79]}],
    "media"=>
     [{"id"=>541689993199382528,
       "id_str"=>"541689993199382528",
       "indices"=>[80, 102],
       "media_url"=>"http://pbs.twimg.com/media/B4R4LccIcAA1z5X.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R4LccIcAA1z5X.png",
       "url"=>"http://t.co/Lw5oFDEAMf",
       "display_url"=>"pic.twitter.com/Lw5oFDEAMf",
       "expanded_url"=>"http://twitter.com/GuyKawasaki/status/541689993350369280/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"medium"=>{"w"=>600, "h"=>338, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "small"=>{"w"=>340, "h"=>191, "resize"=>"fit"},
         "large"=>{"w"=>600, "h"=>338, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541689993199382528,
       "id_str"=>"541689993199382528",
       "indices"=>[80, 102],
       "media_url"=>"http://pbs.twimg.com/media/B4R4LccIcAA1z5X.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R4LccIcAA1z5X.png",
       "url"=>"http://t.co/Lw5oFDEAMf",
       "display_url"=>"pic.twitter.com/Lw5oFDEAMf",
       "expanded_url"=>"http://twitter.com/GuyKawasaki/status/541689993350369280/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"medium"=>{"w"=>600, "h"=>338, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "small"=>{"w"=>340, "h"=>191, "resize"=>"fit"},
         "large"=>{"w"=>600, "h"=>338, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:24:09 +0000 2014",
  "id"=>541689644069289986,
  "id_str"=>"541689644069289986",
  "text"=>"Need graphic design and printing for your business? Check out http://t.co/YisEa5ImBi 07 http://t.co/uiKgLURJkZ",
  "source"=>"<a href=\"http://tweetadder.com\" rel=\"nofollow\">TweetAdder v4</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2239497745,
    "id_str"=>"2239497745",
    "name"=>"SiegePrints.com",
    "screen_name"=>"AmberG1301",
    "location"=>"",
    "profile_location"=>nil,
    "description"=>"50% Off business card prints when you order a custom design. Learn more at http://t.co/31K65WMMy2",
    "url"=>"http://t.co/KB2edu5ZCS",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/KB2edu5ZCS", "expanded_url"=>"http://www.siegeprints.com", "display_url"=>"siegeprints.com", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/31K65WMMy2",
           "expanded_url"=>"http://www.siegeprints.com/Specials.html",
           "display_url"=>"siegeprints.com/Specials.html",
           "indices"=>[75, 97]}]}},
    "protected"=>false,
    "followers_count"=>17090,
    "friends_count"=>13000,
    "listed_count"=>30,
    "created_at"=>"Tue Dec 10 17:08:48 +0000 2013",
    "favourites_count"=>1,
    "utc_offset"=>-25200,
    "time_zone"=>"Arizona",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>15006,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"C0DEED",
    "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2239497745/1415848766",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"C0DEED",
    "profile_sidebar_fill_color"=>"DDEEF6",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>true,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/YisEa5ImBi",
       "expanded_url"=>"http://www.siegeprints.com/Print-Products.html",
       "display_url"=>"siegeprints.com/Print-Products…",
       "indices"=>[62, 84]}],
    "media"=>
     [{"id"=>541689643821838336,
       "id_str"=>"541689643821838336",
       "indices"=>[88, 110],
       "media_url"=>"http://pbs.twimg.com/media/B4R33G6CMAAhhu8.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R33G6CMAAhhu8.png",
       "url"=>"http://t.co/uiKgLURJkZ",
       "display_url"=>"pic.twitter.com/uiKgLURJkZ",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541689644069289986/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541689643821838336,
       "id_str"=>"541689643821838336",
       "indices"=>[88, 110],
       "media_url"=>"http://pbs.twimg.com/media/B4R33G6CMAAhhu8.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R33G6CMAAhhu8.png",
       "url"=>"http://t.co/uiKgLURJkZ",
       "display_url"=>"pic.twitter.com/uiKgLURJkZ",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541689644069289986/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:20:56 +0000 2014",
  "id"=>541688831406538752,
  "id_str"=>"541688831406538752",
  "text"=>"RT @RachelNC9: #Christmas tree farmers say this is busiest weekend for tree shopping! How do you pick the perfect tree? http://t.co/2HbBvVh…",
  "source"=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>14595574,
    "id_str"=>"14595574",
    "name"=>"Mark Horvath",
    "screen_name"=>"hardlynormal",
    "location"=>"Los Angeles, Syracuse and...",
    "profile_location"=>nil,
    "description"=>
     "Just a hardly normal guy trying to navigate through an abnormal world by helping others. Marketing guy. Founder @invisiblepeople http://t.co/a0BGikyhIP",
    "url"=>"http://t.co/e9Wi1N6sAw",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/e9Wi1N6sAw", "expanded_url"=>"http://invisiblepeople.tv", "display_url"=>"invisiblepeople.tv", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/a0BGikyhIP", "expanded_url"=>"http://invisiblepeople.tv/movie", "display_url"=>"invisiblepeople.tv/movie", "indices"=>[129, 151]}]}},
    "protected"=>false,
    "followers_count"=>22132,
    "friends_count"=>1331,
    "listed_count"=>1848,
    "created_at"=>"Wed Apr 30 03:39:30 +0000 2008",
    "favourites_count"=>1689,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>117001,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/14595574/1398654537",
    "profile_link_color"=>"1783F0",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"D7D8DA",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 00:58:16 +0000 2014",
    "id"=>541396238760177664,
    "id_str"=>"541396238760177664",
    "text"=>"#Christmas tree farmers say this is busiest weekend for tree shopping! How do you pick the perfect tree? http://t.co/2HbBvVhQxU #LocalSYR",
    "source"=>"<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>2474614484,
      "id_str"=>"2474614484",
      "name"=>"Rachel Polansky",
      "screen_name"=>"RachelNC9",
      "location"=>"Syracuse",
      "profile_location"=>nil,
      "description"=>"TV Reporter @NewsChannel9. Talk with me beyond the headlines at @RPolanskyNews",
      "url"=>"http://t.co/GvPUcE4P11",
      "entities"=>
       {"url"=>{"urls"=>[{"url"=>"http://t.co/GvPUcE4P11", "expanded_url"=>"http://www.localsyr.com", "display_url"=>"localsyr.com", "indices"=>[0, 22]}]},
        "description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>379,
      "friends_count"=>347,
      "listed_count"=>5,
      "created_at"=>"Fri May 02 22:32:27 +0000 2014",
      "favourites_count"=>76,
      "utc_offset"=>nil,
      "time_zone"=>nil,
      "geo_enabled"=>true,
      "verified"=>false,
      "statuses_count"=>317,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"C0DEED",
      "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/494610797335568384/bvuIuvpf_normal.jpeg",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/494610797335568384/bvuIuvpf_normal.jpeg",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2474614484/1399070294",
      "profile_link_color"=>"0084B4",
      "profile_sidebar_border_color"=>"C0DEED",
      "profile_sidebar_fill_color"=>"DDEEF6",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>true,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>4,
    "favorite_count"=>0,
    "entities"=>
     {"hashtags"=>[{"text"=>"Christmas", "indices"=>[0, 10]}, {"text"=>"LocalSYR", "indices"=>[128, 137]}],
      "symbols"=>[],
      "user_mentions"=>[],
      "urls"=>[{"url"=>"http://t.co/2HbBvVhQxU", "expanded_url"=>"http://bit.ly/1AG5JfA", "display_url"=>"bit.ly/1AG5JfA", "indices"=>[105, 127]}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>4,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[{"text"=>"Christmas", "indices"=>[15, 25]}, {"text"=>"LocalSYR", "indices"=>[139, 140]}],
    "symbols"=>[],
    "user_mentions"=>[{"screen_name"=>"RachelNC9", "name"=>"Rachel Polansky", "id"=>2474614484, "id_str"=>"2474614484", "indices"=>[3, 13]}],
    "urls"=>[{"url"=>"http://t.co/2HbBvVhQxU", "expanded_url"=>"http://bit.ly/1AG5JfA", "display_url"=>"bit.ly/1AG5JfA", "indices"=>[139, 140]}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:20:33 +0000 2014",
  "id"=>541688736762068992,
  "id_str"=>"541688736762068992",
  "text"=>"Little girl starts subway platform dance party [video] http://t.co/tuGNgd6MvM http://t.co/eyoIUrb8ML",
  "source"=>"<a href=\"http://alltop.com/\" rel=\"nofollow\">Alltop Tweets</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>8453452,
    "id_str"=>"8453452",
    "name"=>"Guy Kawasaki",
    "screen_name"=>"GuyKawasaki",
    "location"=>"Silicon Valley, California",
    "profile_location"=>nil,
    "description"=>"Mantra: I empower people. Chief evangelist of Canva. https://t.co/u8Ec658pDq. Author of twelve books. Former chief evangelist of Apple.",
    "url"=>"http://t.co/m4UXWPrgo8",
    "entities"=>
     {"url"=>
       {"urls"=>
         [{"url"=>"http://t.co/m4UXWPrgo8", "expanded_url"=>"http://www.amazon.com/dp/1591848075", "display_url"=>"amazon.com/dp/1591848075", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[{"url"=>"https://t.co/u8Ec658pDq", "expanded_url"=>"https://www.canva.com/", "display_url"=>"canva.com", "indices"=>[53, 76]}]}},
    "protected"=>false,
    "followers_count"=>1435251,
    "friends_count"=>107345,
    "listed_count"=>37040,
    "created_at"=>"Mon Aug 27 03:36:53 +0000 2007",
    "favourites_count"=>829,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>133864,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"131516",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/378800000152022481/fO0TSkrT.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/378800000152022481/fO0TSkrT.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/532396480242266113/W_YUvkCK_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/532396480242266113/W_YUvkCK_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/8453452/1417478012",
    "profile_link_color"=>"DD2E44",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"FCFCFC",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>false,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>6,
  "favorite_count"=>4,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/tuGNgd6MvM",
       "expanded_url"=>"http://holykaw.alltop.com/little-girl-starts-subway-platform-dance-party-video?gk1",
       "display_url"=>"holykaw.alltop.com/little-girl-st…",
       "indices"=>[55, 77]}],
    "media"=>
     [{"id"=>541688736653017088,
       "id_str"=>"541688736653017088",
       "indices"=>[78, 100],
       "media_url"=>"http://pbs.twimg.com/media/B4R3CTcIgAAd0xA.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R3CTcIgAAd0xA.png",
       "url"=>"http://t.co/eyoIUrb8ML",
       "display_url"=>"pic.twitter.com/eyoIUrb8ML",
       "expanded_url"=>"http://twitter.com/GuyKawasaki/status/541688736762068992/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"medium"=>{"w"=>600, "h"=>338, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "small"=>{"w"=>340, "h"=>191, "resize"=>"fit"},
         "large"=>{"w"=>600, "h"=>338, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541688736653017088,
       "id_str"=>"541688736653017088",
       "indices"=>[78, 100],
       "media_url"=>"http://pbs.twimg.com/media/B4R3CTcIgAAd0xA.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R3CTcIgAAd0xA.png",
       "url"=>"http://t.co/eyoIUrb8ML",
       "display_url"=>"pic.twitter.com/eyoIUrb8ML",
       "expanded_url"=>"http://twitter.com/GuyKawasaki/status/541688736762068992/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"medium"=>{"w"=>600, "h"=>338, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "small"=>{"w"=>340, "h"=>191, "resize"=>"fit"},
         "large"=>{"w"=>600, "h"=>338, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:19:07 +0000 2014",
  "id"=>541688373766025218,
  "id_str"=>"541688373766025218",
  "text"=>"Top 10 most expensive homes in the world http://t.co/6aaofd9P6O via @bokauffmann",
  "source"=>"<a href=\"http://triberr.com\" rel=\"nofollow\">Triberr</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>22634164,
    "id_str"=>"22634164",
    "name"=>"Meghan M. Biro",
    "screen_name"=>"MeghanMBiro",
    "location"=>"Cambridge, MA ",
    "profile_location"=>nil,
    "description"=>"CEO @TalentCulture #TChat Wed 7-8pmET Contributor @EntMagazine @Forbes @HuffingtonPost Top Ranked #Leadership #Socbiz #HR Expert Twitter",
    "url"=>"http://t.co/MzzId6vQLu",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/MzzId6vQLu", "expanded_url"=>"http://www.talentculture.com", "display_url"=>"talentculture.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>89384,
    "friends_count"=>63586,
    "listed_count"=>3989,
    "created_at"=>"Tue Mar 03 15:26:39 +0000 2009",
    "favourites_count"=>4552,
    "utc_offset"=>-18000,
    "time_zone"=>"Eastern Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>false,
    "statuses_count"=>160538,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"009DDC",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/446495737635819521/XzyQ7TRg.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/446495737635819521/XzyQ7TRg.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/470235022360727552/MPCnmWX0_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/470235022360727552/MPCnmWX0_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/22634164/1359909277",
    "profile_link_color"=>"31A621",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"DEF6FF",
    "profile_text_color"=>"3D1957",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>1,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[{"screen_name"=>"bokauffmann", "name"=>"Bo Kauffmann", "id"=>19286347, "id_str"=>"19286347", "indices"=>[68, 80]}],
    "urls"=>[{"url"=>"http://t.co/6aaofd9P6O", "expanded_url"=>"http://goo.gl/v6AHgq", "display_url"=>"goo.gl/v6AHgq", "indices"=>[41, 63]}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:18:52 +0000 2014",
  "id"=>541688311706697728,
  "id_str"=>"541688311706697728",
  "text"=>"Would you like a Custom Business Card or PostCard design? Visit http://t.co/hbRQbo5BxR 08 http://t.co/wBwJ7apCDq",
  "source"=>"<a href=\"http://tweetadder.com\" rel=\"nofollow\">TweetAdder v4</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2239497745,
    "id_str"=>"2239497745",
    "name"=>"SiegePrints.com",
    "screen_name"=>"AmberG1301",
    "location"=>"",
    "profile_location"=>nil,
    "description"=>"50% Off business card prints when you order a custom design. Learn more at http://t.co/31K65WMMy2",
    "url"=>"http://t.co/KB2edu5ZCS",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/KB2edu5ZCS", "expanded_url"=>"http://www.siegeprints.com", "display_url"=>"siegeprints.com", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/31K65WMMy2",
           "expanded_url"=>"http://www.siegeprints.com/Specials.html",
           "display_url"=>"siegeprints.com/Specials.html",
           "indices"=>[75, 97]}]}},
    "protected"=>false,
    "followers_count"=>17090,
    "friends_count"=>13000,
    "listed_count"=>30,
    "created_at"=>"Tue Dec 10 17:08:48 +0000 2013",
    "favourites_count"=>1,
    "utc_offset"=>-25200,
    "time_zone"=>"Arizona",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>15006,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"C0DEED",
    "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2239497745/1415848766",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"C0DEED",
    "profile_sidebar_fill_color"=>"DDEEF6",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>true,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/hbRQbo5BxR", "expanded_url"=>"http://www.siegeprints.com/specials.html", "display_url"=>"siegeprints.com/specials.html", "indices"=>[64, 86]}],
    "media"=>
     [{"id"=>541688311354388480,
       "id_str"=>"541688311354388480",
       "indices"=>[90, 112],
       "media_url"=>"http://pbs.twimg.com/media/B4R2pjFCcAAlPU8.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R2pjFCcAAlPU8.png",
       "url"=>"http://t.co/wBwJ7apCDq",
       "display_url"=>"pic.twitter.com/wBwJ7apCDq",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541688311706697728/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541688311354388480,
       "id_str"=>"541688311354388480",
       "indices"=>[90, 112],
       "media_url"=>"http://pbs.twimg.com/media/B4R2pjFCcAAlPU8.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R2pjFCcAAlPU8.png",
       "url"=>"http://t.co/wBwJ7apCDq",
       "display_url"=>"pic.twitter.com/wBwJ7apCDq",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541688311706697728/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:17:41 +0000 2014",
  "id"=>541688014297378819,
  "id_str"=>"541688014297378819",
  "text"=>"This company indoctrinates young recruits with 10 weeks in a condo, testing company products http://t.co/eqR2aWT5BD http://t.co/d60NORtGN0",
  "source"=>"<a href=\"http://www.socialflow.com\" rel=\"nofollow\">SocialFlow</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>280716675,
    "id_str"=>"280716675",
    "name"=>"Co.Exist",
    "screen_name"=>"FastCoExist",
    "location"=>"New York, NY",
    "profile_location"=>nil,
    "description"=>"Fast Company's Co.Exist: World changing ideas and innovation. We talk about the environment, energy, tech, food, health, transportation, & more.",
    "url"=>"http://t.co/MdG8bFyi4o",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/MdG8bFyi4o", "expanded_url"=>"http://www.fastcoexist.com/", "display_url"=>"fastcoexist.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>162910,
    "friends_count"=>835,
    "listed_count"=>4729,
    "created_at"=>"Mon Apr 11 22:21:34 +0000 2011",
    "favourites_count"=>117,
    "utc_offset"=>-18000,
    "time_zone"=>"Quito",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>27343,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"000000",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/425047010/0214-2560x1600-co-exist-twitter-backgrd-3.png",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/425047010/0214-2560x1600-co-exist-twitter-backgrd-3.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/482524726053445632/fLzR3gA__normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/482524726053445632/fLzR3gA__normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/280716675/1416233889",
    "profile_link_color"=>"A34A90",
    "profile_sidebar_border_color"=>"C0DEED",
    "profile_sidebar_fill_color"=>"333333",
    "profile_text_color"=>"999999",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>1,
  "favorite_count"=>2,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>[{"url"=>"http://t.co/eqR2aWT5BD", "expanded_url"=>"http://f-st.co/aoSJgK0", "display_url"=>"f-st.co/aoSJgK0", "indices"=>[93, 115]}],
    "media"=>
     [{"id"=>541688014200901632,
       "id_str"=>"541688014200901632",
       "indices"=>[116, 138],
       "media_url"=>"http://pbs.twimg.com/media/B4R2YQGIEAA50uj.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R2YQGIEAA50uj.jpg",
       "url"=>"http://t.co/d60NORtGN0",
       "display_url"=>"pic.twitter.com/d60NORtGN0",
       "expanded_url"=>"http://twitter.com/FastCoExist/status/541688014297378819/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>226, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>400, "resize"=>"fit"},
         "large"=>{"w"=>750, "h"=>500, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541688014200901632,
       "id_str"=>"541688014200901632",
       "indices"=>[116, 138],
       "media_url"=>"http://pbs.twimg.com/media/B4R2YQGIEAA50uj.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R2YQGIEAA50uj.jpg",
       "url"=>"http://t.co/d60NORtGN0",
       "display_url"=>"pic.twitter.com/d60NORtGN0",
       "expanded_url"=>"http://twitter.com/FastCoExist/status/541688014297378819/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>226, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>400, "resize"=>"fit"},
         "large"=>{"w"=>750, "h"=>500, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:16:45 +0000 2014",
  "id"=>541687778946605056,
  "id_str"=>"541687778946605056",
  "text"=>"So awesome seeing how excited @AnitaLeitgeb is about her photo being retweeted by  @NewsChannel9 and others! :)",
  "source"=>"<a href=\"http://stone.com/Twittelator\" rel=\"nofollow\">Twittelator</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>14595574,
    "id_str"=>"14595574",
    "name"=>"Mark Horvath",
    "screen_name"=>"hardlynormal",
    "location"=>"Los Angeles, Syracuse and...",
    "profile_location"=>nil,
    "description"=>
     "Just a hardly normal guy trying to navigate through an abnormal world by helping others. Marketing guy. Founder @invisiblepeople http://t.co/a0BGikyhIP",
    "url"=>"http://t.co/e9Wi1N6sAw",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/e9Wi1N6sAw", "expanded_url"=>"http://invisiblepeople.tv", "display_url"=>"invisiblepeople.tv", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/a0BGikyhIP", "expanded_url"=>"http://invisiblepeople.tv/movie", "display_url"=>"invisiblepeople.tv/movie", "indices"=>[129, 151]}]}},
    "protected"=>false,
    "followers_count"=>22132,
    "friends_count"=>1331,
    "listed_count"=>1848,
    "created_at"=>"Wed Apr 30 03:39:30 +0000 2008",
    "favourites_count"=>1689,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>117001,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/14595574/1398654537",
    "profile_link_color"=>"1783F0",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"D7D8DA",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>1,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>
     [{"screen_name"=>"AnitaLeitgeb", "name"=>"Anita Leitgeb", "id"=>1954209385, "id_str"=>"1954209385", "indices"=>[30, 43]},
      {"screen_name"=>"NewsChannel9", "name"=>"NewsChannel 9", "id"=>15135715, "id_str"=>"15135715", "indices"=>[83, 96]}],
    "urls"=>[]},
  "favorited"=>false,
  "retweeted"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:16:04 +0000 2014",
  "id"=>541687609253056512,
  "id_str"=>"541687609253056512",
  "text"=>"Fun Nerdist Podcast week ahead! Mon: @wilw; Wed: Benedict Cumberbatch; Fri: @LisaKudrow",
  "source"=>"<a href=\"http://tapbots.com/tweetbot\" rel=\"nofollow\">Tweetbot for iΟS</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>15666380,
    "id_str"=>"15666380",
    "name"=>"Chris Hardwick",
    "screen_name"=>"nerdist",
    "location"=>"Lawss Angleez",
    "profile_location"=>nil,
    "description"=>"Stand-upper, Zombie Therapist, Talking Snake and POINTS giver",
    "url"=>"http://t.co/WmKtIZV83l",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/WmKtIZV83l", "expanded_url"=>"http://www.nerdist.com", "display_url"=>"nerdist.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>2457421,
    "friends_count"=>659,
    "listed_count"=>21316,
    "created_at"=>"Wed Jul 30 21:20:18 +0000 2008",
    "favourites_count"=>672,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>24272,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"ECDFCE",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/23601674/Nerdist_Twitter_Bkgrnd.jpg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/23601674/Nerdist_Twitter_Bkgrnd.jpg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/489572042815967232/Hq8pfyEx_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/489572042815967232/Hq8pfyEx_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/15666380/1354994055",
    "profile_link_color"=>"BA494D",
    "profile_sidebar_border_color"=>"BA494D",
    "profile_sidebar_fill_color"=>"83989D",
    "profile_text_color"=>"1F3C4C",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>55,
  "favorite_count"=>157,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>
     [{"screen_name"=>"wilw", "name"=>"Wil Wheaton", "id"=>1183041, "id_str"=>"1183041", "indices"=>[37, 42]},
      {"screen_name"=>"LisaKudrow", "name"=>"Lisa Kudrow", "id"=>243905905, "id_str"=>"243905905", "indices"=>[76, 87]}],
    "urls"=>[]},
  "favorited"=>false,
  "retweeted"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:15:35 +0000 2014",
  "id"=>541687486997872640,
  "id_str"=>"541687486997872640",
  "text"=>"RT @rmlifechanging: Thank you Jim and Juli Boeheim! When you call now your gift will be matched! 18888086770 or http://t.co/NWSC3qs7Od http…",
  "source"=>"<a href=\"http://stone.com/Twittelator\" rel=\"nofollow\">Twittelator</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>14595574,
    "id_str"=>"14595574",
    "name"=>"Mark Horvath",
    "screen_name"=>"hardlynormal",
    "location"=>"Los Angeles, Syracuse and...",
    "profile_location"=>nil,
    "description"=>
     "Just a hardly normal guy trying to navigate through an abnormal world by helping others. Marketing guy. Founder @invisiblepeople http://t.co/a0BGikyhIP",
    "url"=>"http://t.co/e9Wi1N6sAw",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/e9Wi1N6sAw", "expanded_url"=>"http://invisiblepeople.tv", "display_url"=>"invisiblepeople.tv", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/a0BGikyhIP", "expanded_url"=>"http://invisiblepeople.tv/movie", "display_url"=>"invisiblepeople.tv/movie", "indices"=>[129, 151]}]}},
    "protected"=>false,
    "followers_count"=>22132,
    "friends_count"=>1331,
    "listed_count"=>1848,
    "created_at"=>"Wed Apr 30 03:39:30 +0000 2008",
    "favourites_count"=>1689,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>117001,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/14595574/1398654537",
    "profile_link_color"=>"1783F0",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"D7D8DA",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 19:38:33 +0000 2014",
    "id"=>541678166075785216,
    "id_str"=>"541678166075785216",
    "text"=>"Thank you Jim and Juli Boeheim! When you call now your gift will be matched! 18888086770 or http://t.co/NWSC3qs7Od http://t.co/oGFGkXxAia",
    "source"=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>508875685,
      "id_str"=>"508875685",
      "name"=>"Rescue Mission",
      "screen_name"=>"rmlifechanging",
      "location"=>"Syracuse, NY",
      "profile_location"=>nil,
      "description"=>"One mission to Share Hope, End Hunger and Homelessness, and Change Lives, Strengthening Communities One Person at a Time.",
      "url"=>"http://t.co/8Kw11lSQdB",
      "entities"=>
       {"url"=>{"urls"=>[{"url"=>"http://t.co/8Kw11lSQdB", "expanded_url"=>"http://www.rmlifechanging.org", "display_url"=>"rmlifechanging.org", "indices"=>[0, 22]}]},
        "description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>1338,
      "friends_count"=>666,
      "listed_count"=>32,
      "created_at"=>"Wed Feb 29 14:00:01 +0000 2012",
      "favourites_count"=>267,
      "utc_offset"=>-18000,
      "time_zone"=>"Eastern Time (US & Canada)",
      "geo_enabled"=>true,
      "verified"=>false,
      "statuses_count"=>3671,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"131516",
      "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/446374921535356928/WDGdUIF2.jpeg",
      "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/446374921535356928/WDGdUIF2.jpeg",
      "profile_background_tile"=>true,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/468771449965015041/HotM37tV_normal.jpeg",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/468771449965015041/HotM37tV_normal.jpeg",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/508875685/1400596659",
      "profile_link_color"=>"BF2F39",
      "profile_sidebar_border_color"=>"FFFFFF",
      "profile_sidebar_fill_color"=>"EFEFEF",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>false,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>2,
    "favorite_count"=>2,
    "entities"=>
     {"hashtags"=>[],
      "symbols"=>[],
      "user_mentions"=>[],
      "urls"=>[{"url"=>"http://t.co/NWSC3qs7Od", "expanded_url"=>"http://moviewithamission.com", "display_url"=>"moviewithamission.com", "indices"=>[92, 114]}],
      "media"=>
       [{"id"=>541678160149237760,
         "id_str"=>"541678160149237760",
         "indices"=>[115, 137],
         "media_url"=>"http://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
         "url"=>"http://t.co/oGFGkXxAia",
         "display_url"=>"pic.twitter.com/oGFGkXxAia",
         "expanded_url"=>"http://twitter.com/rmlifechanging/status/541678166075785216/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
           "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "large"=>{"w"=>1024, "h"=>768, "resize"=>"fit"}}}]},
    "extended_entities"=>
     {"media"=>
       [{"id"=>541678160149237760,
         "id_str"=>"541678160149237760",
         "indices"=>[115, 137],
         "media_url"=>"http://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
         "url"=>"http://t.co/oGFGkXxAia",
         "display_url"=>"pic.twitter.com/oGFGkXxAia",
         "expanded_url"=>"http://twitter.com/rmlifechanging/status/541678166075785216/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
           "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "large"=>{"w"=>1024, "h"=>768, "resize"=>"fit"}}}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>2,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[{"screen_name"=>"rmlifechanging", "name"=>"Rescue Mission", "id"=>508875685, "id_str"=>"508875685", "indices"=>[3, 18]}],
    "urls"=>[{"url"=>"http://t.co/NWSC3qs7Od", "expanded_url"=>"http://moviewithamission.com", "display_url"=>"moviewithamission.com", "indices"=>[112, 134]}],
    "media"=>
     [{"id"=>541678160149237760,
       "id_str"=>"541678160149237760",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
       "url"=>"http://t.co/oGFGkXxAia",
       "display_url"=>"pic.twitter.com/oGFGkXxAia",
       "expanded_url"=>"http://twitter.com/rmlifechanging/status/541678166075785216/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
         "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "large"=>{"w"=>1024, "h"=>768, "resize"=>"fit"}},
       "source_status_id"=>541678166075785216,
       "source_status_id_str"=>"541678166075785216",
       "source_user_id"=>508875685,
       "source_user_id_str"=>"508875685"}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541678160149237760,
       "id_str"=>"541678160149237760",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rtaq5IUAAveAJ.jpg",
       "url"=>"http://t.co/oGFGkXxAia",
       "display_url"=>"pic.twitter.com/oGFGkXxAia",
       "expanded_url"=>"http://twitter.com/rmlifechanging/status/541678166075785216/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
         "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "large"=>{"w"=>1024, "h"=>768, "resize"=>"fit"}},
       "source_status_id"=>541678166075785216,
       "source_status_id_str"=>"541678166075785216",
       "source_user_id"=>508875685,
       "source_user_id_str"=>"508875685"}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:15:26 +0000 2014",
  "id"=>541687450008305664,
  "id_str"=>"541687450008305664",
  "text"=>"RT @JeanneKorchak: .@rmlifechanging Board members taking calls for Movie with a Mission! @jcole5010 @ChrisFMFEWM #twitterlesslaura http://t…",
  "source"=>"<a href=\"http://stone.com/Twittelator\" rel=\"nofollow\">Twittelator</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>14595574,
    "id_str"=>"14595574",
    "name"=>"Mark Horvath",
    "screen_name"=>"hardlynormal",
    "location"=>"Los Angeles, Syracuse and...",
    "profile_location"=>nil,
    "description"=>
     "Just a hardly normal guy trying to navigate through an abnormal world by helping others. Marketing guy. Founder @invisiblepeople http://t.co/a0BGikyhIP",
    "url"=>"http://t.co/e9Wi1N6sAw",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/e9Wi1N6sAw", "expanded_url"=>"http://invisiblepeople.tv", "display_url"=>"invisiblepeople.tv", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/a0BGikyhIP", "expanded_url"=>"http://invisiblepeople.tv/movie", "display_url"=>"invisiblepeople.tv/movie", "indices"=>[129, 151]}]}},
    "protected"=>false,
    "followers_count"=>22132,
    "friends_count"=>1331,
    "listed_count"=>1848,
    "created_at"=>"Wed Apr 30 03:39:30 +0000 2008",
    "favourites_count"=>1689,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>true,
    "verified"=>true,
    "statuses_count"=>117001,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/458736481373134848/UQSPbOyv.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/536193070203564033/orsdpzHq_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/14595574/1398654537",
    "profile_link_color"=>"1783F0",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"D7D8DA",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 19:38:36 +0000 2014",
    "id"=>541678180328042496,
    "id_str"=>"541678180328042496",
    "text"=>".@rmlifechanging Board members taking calls for Movie with a Mission! @jcole5010 @ChrisFMFEWM #twitterlesslaura http://t.co/jOGwKEwQlz",
    "source"=>"<a href=\"http://www.apple.com\" rel=\"nofollow\">iOS</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>314133952,
      "id_str"=>"314133952",
      "name"=>"Jeanne",
      "screen_name"=>"JeanneKorchak",
      "location"=>"Syracuse, NY  ",
      "profile_location"=>nil,
      "description"=>"Senior Administrator for Corporate Human Resource @OBrien_Gere. Board member Rescue Mission of Syracuse @rmlifechanging.org. My tweets are my own.",
      "url"=>nil,
      "entities"=>{"description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>100,
      "friends_count"=>86,
      "listed_count"=>2,
      "created_at"=>"Thu Jun 09 19:26:38 +0000 2011",
      "favourites_count"=>470,
      "utc_offset"=>-36000,
      "time_zone"=>"Hawaii",
      "geo_enabled"=>false,
      "verified"=>false,
      "statuses_count"=>942,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"FFF04D",
      "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme19/bg.gif",
      "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme19/bg.gif",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/2102559174/Korchak_Jeanne_0807_normal.jpg",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/2102559174/Korchak_Jeanne_0807_normal.jpg",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/314133952/1414348229",
      "profile_link_color"=>"0099CC",
      "profile_sidebar_border_color"=>"FFF8AD",
      "profile_sidebar_fill_color"=>"F6FFD1",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>false,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>3,
    "favorite_count"=>0,
    "entities"=>
     {"hashtags"=>[{"text"=>"twitterlesslaura", "indices"=>[94, 111]}],
      "symbols"=>[],
      "user_mentions"=>
       [{"screen_name"=>"rmlifechanging", "name"=>"Rescue Mission", "id"=>508875685, "id_str"=>"508875685", "indices"=>[1, 16]},
        {"screen_name"=>"jcole5010", "name"=>"Jean Cole", "id"=>2396166452, "id_str"=>"2396166452", "indices"=>[70, 80]},
        {"screen_name"=>"ChrisFMFEWM", "name"=>"Chris Gardner", "id"=>2869803259, "id_str"=>"2869803259", "indices"=>[81, 93]}],
      "urls"=>[],
      "media"=>
       [{"id"=>541678180126707712,
         "id_str"=>"541678180126707712",
         "indices"=>[112, 134],
         "media_url"=>"http://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
         "url"=>"http://t.co/jOGwKEwQlz",
         "display_url"=>"pic.twitter.com/jOGwKEwQlz",
         "expanded_url"=>"http://twitter.com/JeanneKorchak/status/541678180328042496/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"large"=>{"w"=>960, "h"=>720, "resize"=>"fit"},
           "small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
           "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"}}}]},
    "extended_entities"=>
     {"media"=>
       [{"id"=>541678180126707712,
         "id_str"=>"541678180126707712",
         "indices"=>[112, 134],
         "media_url"=>"http://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
         "url"=>"http://t.co/jOGwKEwQlz",
         "display_url"=>"pic.twitter.com/jOGwKEwQlz",
         "expanded_url"=>"http://twitter.com/JeanneKorchak/status/541678180328042496/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"large"=>{"w"=>960, "h"=>720, "resize"=>"fit"},
           "small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
           "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"}}}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>3,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[{"text"=>"twitterlesslaura", "indices"=>[113, 130]}],
    "symbols"=>[],
    "user_mentions"=>
     [{"screen_name"=>"JeanneKorchak", "name"=>"Jeanne", "id"=>314133952, "id_str"=>"314133952", "indices"=>[3, 17]},
      {"screen_name"=>"rmlifechanging", "name"=>"Rescue Mission", "id"=>508875685, "id_str"=>"508875685", "indices"=>[20, 35]},
      {"screen_name"=>"jcole5010", "name"=>"Jean Cole", "id"=>2396166452, "id_str"=>"2396166452", "indices"=>[89, 99]},
      {"screen_name"=>"ChrisFMFEWM", "name"=>"Chris Gardner", "id"=>2869803259, "id_str"=>"2869803259", "indices"=>[100, 112]}],
    "urls"=>[],
    "media"=>
     [{"id"=>541678180126707712,
       "id_str"=>"541678180126707712",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
       "url"=>"http://t.co/jOGwKEwQlz",
       "display_url"=>"pic.twitter.com/jOGwKEwQlz",
       "expanded_url"=>"http://twitter.com/JeanneKorchak/status/541678180328042496/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>960, "h"=>720, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
         "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"}},
       "source_status_id"=>541678180328042496,
       "source_status_id_str"=>"541678180328042496",
       "source_user_id"=>314133952,
       "source_user_id_str"=>"314133952"}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541678180126707712,
       "id_str"=>"541678180126707712",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rtb1UIUAA9IH0.jpg",
       "url"=>"http://t.co/jOGwKEwQlz",
       "display_url"=>"pic.twitter.com/jOGwKEwQlz",
       "expanded_url"=>"http://twitter.com/JeanneKorchak/status/541678180328042496/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>960, "h"=>720, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>255, "resize"=>"fit"},
         "medium"=>{"w"=>600, "h"=>450, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"}},
       "source_status_id"=>541678180328042496,
       "source_status_id_str"=>"541678180328042496",
       "source_user_id"=>314133952,
       "source_user_id_str"=>"314133952"}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:13:27 +0000 2014",
  "id"=>541686949556133888,
  "id_str"=>"541686949556133888",
  "text"=>"Would you like a Custom Business Card or PostCard design? Visit http://t.co/hbRQbo5BxR 01 http://t.co/kWWyLhEory",
  "source"=>"<a href=\"http://tweetadder.com\" rel=\"nofollow\">TweetAdder v4</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2239497745,
    "id_str"=>"2239497745",
    "name"=>"SiegePrints.com",
    "screen_name"=>"AmberG1301",
    "location"=>"",
    "profile_location"=>nil,
    "description"=>"50% Off business card prints when you order a custom design. Learn more at http://t.co/31K65WMMy2",
    "url"=>"http://t.co/KB2edu5ZCS",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/KB2edu5ZCS", "expanded_url"=>"http://www.siegeprints.com", "display_url"=>"siegeprints.com", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/31K65WMMy2",
           "expanded_url"=>"http://www.siegeprints.com/Specials.html",
           "display_url"=>"siegeprints.com/Specials.html",
           "indices"=>[75, 97]}]}},
    "protected"=>false,
    "followers_count"=>17090,
    "friends_count"=>13000,
    "listed_count"=>30,
    "created_at"=>"Tue Dec 10 17:08:48 +0000 2013",
    "favourites_count"=>1,
    "utc_offset"=>-25200,
    "time_zone"=>"Arizona",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>15006,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"C0DEED",
    "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2239497745/1415848766",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"C0DEED",
    "profile_sidebar_fill_color"=>"DDEEF6",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>true,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/hbRQbo5BxR", "expanded_url"=>"http://www.siegeprints.com/specials.html", "display_url"=>"siegeprints.com/specials.html", "indices"=>[64, 86]}],
    "media"=>
     [{"id"=>541686949279318016,
       "id_str"=>"541686949279318016",
       "indices"=>[90, 112],
       "media_url"=>"http://pbs.twimg.com/media/B4R1aQ9CQAA3Yxu.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R1aQ9CQAA3Yxu.png",
       "url"=>"http://t.co/kWWyLhEory",
       "display_url"=>"pic.twitter.com/kWWyLhEory",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541686949556133888/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541686949279318016,
       "id_str"=>"541686949279318016",
       "indices"=>[90, 112],
       "media_url"=>"http://pbs.twimg.com/media/B4R1aQ9CQAA3Yxu.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R1aQ9CQAA3Yxu.png",
       "url"=>"http://t.co/kWWyLhEory",
       "display_url"=>"pic.twitter.com/kWWyLhEory",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541686949556133888/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:11:50 +0000 2014",
  "id"=>541686542482542593,
  "id_str"=>"541686542482542593",
  "text"=>"RT @JayPharoah: Baby Yeezus #Hanhhhhh http://t.co/qNqzxRYWRX",
  "source"=>"<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>22891326,
    "id_str"=>"22891326",
    "name"=>"Jose Ramon Marquez",
    "screen_name"=>"joseramonmarmtz",
    "location"=>"Aguascalientes, Mexico",
    "profile_location"=>nil,
    "description"=>"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.",
    "url"=>"http://t.co/9lh90BLhAU",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/9lh90BLhAU", "expanded_url"=>"http://cokesnlfan.tumblr.com", "display_url"=>"cokesnlfan.tumblr.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1910,
    "friends_count"=>853,
    "listed_count"=>23,
    "created_at"=>"Thu Mar 05 06:44:29 +0000 2009",
    "favourites_count"=>18152,
    "utc_offset"=>-21600,
    "time_zone"=>"Central Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>97736,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"B2DFDA",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_tile"=>true,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/22891326/1409898695",
    "profile_link_color"=>"93A644",
    "profile_sidebar_border_color"=>"000000",
    "profile_sidebar_fill_color"=>"C0DFEC",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 18:54:45 +0000 2014",
    "id"=>541667145357078528,
    "id_str"=>"541667145357078528",
    "text"=>"Baby Yeezus #Hanhhhhh http://t.co/qNqzxRYWRX",
    "source"=>"<a href=\"http://www.facebook.com/twitter\" rel=\"nofollow\">Facebook</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>25343191,
      "id_str"=>"25343191",
      "name"=>"Jay Pharoah",
      "screen_name"=>"JayPharoah",
      "location"=>"In a studio working",
      "profile_location"=>nil,
      "description"=>"http://t.co/gExE7TmkW3 http://t.co/1MeISDyozg",
      "url"=>"http://t.co/rasuClpO3k",
      "entities"=>
       {"url"=>{"urls"=>[{"url"=>"http://t.co/rasuClpO3k", "expanded_url"=>"http://www.jaypharoah.com", "display_url"=>"jaypharoah.com", "indices"=>[0, 22]}]},
        "description"=>
         {"urls"=>
           [{"url"=>"http://t.co/gExE7TmkW3", "expanded_url"=>"http://facebook.com/jaypharoah1", "display_url"=>"facebook.com/jaypharoah1", "indices"=>[0, 22]},
            {"url"=>"http://t.co/1MeISDyozg", "expanded_url"=>"http://www.instagram.com/jaypharoah", "display_url"=>"instagram.com/jaypharoah", "indices"=>[23, 45]}]}},
      "protected"=>false,
      "followers_count"=>134366,
      "friends_count"=>1788,
      "listed_count"=>1065,
      "created_at"=>"Thu Mar 19 17:26:23 +0000 2009",
      "favourites_count"=>51,
      "utc_offset"=>-28800,
      "time_zone"=>"Pacific Time (US & Canada)",
      "geo_enabled"=>false,
      "verified"=>true,
      "statuses_count"=>11976,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"1B1F1A",
      "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/833892245/ed7eedb7678ef81e2c1971ff784065d5.jpeg",
      "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/833892245/ed7eedb7678ef81e2c1971ff784065d5.jpeg",
      "profile_background_tile"=>true,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/378800000532194658/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/378800000532194658/29482d91a388be2a2db45c8ef94b5da9_normal.jpeg",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/25343191/1400553237",
      "profile_link_color"=>"5FEF2F",
      "profile_sidebar_border_color"=>"FFFFFF",
      "profile_sidebar_fill_color"=>"000000",
      "profile_text_color"=>"666666",
      "profile_use_background_image"=>true,
      "default_profile"=>false,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>5,
    "favorite_count"=>19,
    "entities"=>
     {"hashtags"=>[{"text"=>"Hanhhhhh", "indices"=>[12, 21]}],
      "symbols"=>[],
      "user_mentions"=>[],
      "urls"=>[{"url"=>"http://t.co/qNqzxRYWRX", "expanded_url"=>"http://fb.me/7h9sQNefy", "display_url"=>"fb.me/7h9sQNefy", "indices"=>[22, 44]}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>5,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[{"text"=>"Hanhhhhh", "indices"=>[28, 37]}],
    "symbols"=>[],
    "user_mentions"=>[{"screen_name"=>"JayPharoah", "name"=>"Jay Pharoah", "id"=>25343191, "id_str"=>"25343191", "indices"=>[3, 14]}],
    "urls"=>[{"url"=>"http://t.co/qNqzxRYWRX", "expanded_url"=>"http://fb.me/7h9sQNefy", "display_url"=>"fb.me/7h9sQNefy", "indices"=>[38, 60]}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:11:21 +0000 2014",
  "id"=>541686420826767361,
  "id_str"=>"541686420826767361",
  "text"=>"RT @NBCMarryMe: Staging a protest, running from a bear, or woke up like this? Find out on #MarryMe this Tuesday at 9/8c on @NBC! http://t.c…",
  "source"=>"<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>22891326,
    "id_str"=>"22891326",
    "name"=>"Jose Ramon Marquez",
    "screen_name"=>"joseramonmarmtz",
    "location"=>"Aguascalientes, Mexico",
    "profile_location"=>nil,
    "description"=>"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.",
    "url"=>"http://t.co/9lh90BLhAU",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/9lh90BLhAU", "expanded_url"=>"http://cokesnlfan.tumblr.com", "display_url"=>"cokesnlfan.tumblr.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1910,
    "friends_count"=>853,
    "listed_count"=>23,
    "created_at"=>"Thu Mar 05 06:44:29 +0000 2009",
    "favourites_count"=>18152,
    "utc_offset"=>-21600,
    "time_zone"=>"Central Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>97736,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"B2DFDA",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_tile"=>true,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/22891326/1409898695",
    "profile_link_color"=>"93A644",
    "profile_sidebar_border_color"=>"000000",
    "profile_sidebar_fill_color"=>"C0DFEC",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 19:00:59 +0000 2014",
    "id"=>541668713712594945,
    "id_str"=>"541668713712594945",
    "text"=>"Staging a protest, running from a bear, or woke up like this? Find out on #MarryMe this Tuesday at 9/8c on @NBC! http://t.co/ap8oHUvjbw",
    "source"=>"<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">Hootsuite</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>2396412661,
      "id_str"=>"2396412661",
      "name"=>"Marry Me",
      "screen_name"=>"NBCMarryMe",
      "location"=>"NBC",
      "profile_location"=>nil,
      "description"=>"The official Twitter handle for #MarryMe. Tuesdays at 9/8c on @NBC!",
      "url"=>"http://t.co/9JcfmpX4ud",
      "entities"=>
       {"url"=>{"urls"=>[{"url"=>"http://t.co/9JcfmpX4ud", "expanded_url"=>"http://www.nbc.com/marry-me", "display_url"=>"nbc.com/marry-me", "indices"=>[0, 22]}]},
        "description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>11742,
      "friends_count"=>181,
      "listed_count"=>65,
      "created_at"=>"Tue Mar 18 15:36:47 +0000 2014",
      "favourites_count"=>239,
      "utc_offset"=>-18000,
      "time_zone"=>"Eastern Time (US & Canada)",
      "geo_enabled"=>false,
      "verified"=>true,
      "statuses_count"=>1165,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"C0DEED",
      "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/509329514304786433/FB7unVxJ_normal.jpeg",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/509329514304786433/FB7unVxJ_normal.jpeg",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2396412661/1410268653",
      "profile_link_color"=>"0084B4",
      "profile_sidebar_border_color"=>"C0DEED",
      "profile_sidebar_fill_color"=>"DDEEF6",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>true,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>1,
    "favorite_count"=>5,
    "entities"=>
     {"hashtags"=>[{"text"=>"MarryMe", "indices"=>[74, 82]}],
      "symbols"=>[],
      "user_mentions"=>[{"screen_name"=>"nbc", "name"=>"NBC", "id"=>26585095, "id_str"=>"26585095", "indices"=>[107, 111]}],
      "urls"=>[],
      "media"=>
       [{"id"=>541668713209286656,
         "id_str"=>"541668713209286656",
         "indices"=>[113, 135],
         "media_url"=>"http://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
         "url"=>"http://t.co/ap8oHUvjbw",
         "display_url"=>"pic.twitter.com/ap8oHUvjbw",
         "expanded_url"=>"http://twitter.com/NBCMarryMe/status/541668713712594945/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"large"=>{"w"=>1000, "h"=>500, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "medium"=>{"w"=>600, "h"=>300, "resize"=>"fit"},
           "small"=>{"w"=>340, "h"=>170, "resize"=>"fit"}}}]},
    "extended_entities"=>
     {"media"=>
       [{"id"=>541668713209286656,
         "id_str"=>"541668713209286656",
         "indices"=>[113, 135],
         "media_url"=>"http://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
         "url"=>"http://t.co/ap8oHUvjbw",
         "display_url"=>"pic.twitter.com/ap8oHUvjbw",
         "expanded_url"=>"http://twitter.com/NBCMarryMe/status/541668713712594945/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"large"=>{"w"=>1000, "h"=>500, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "medium"=>{"w"=>600, "h"=>300, "resize"=>"fit"},
           "small"=>{"w"=>340, "h"=>170, "resize"=>"fit"}}}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>1,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[{"text"=>"MarryMe", "indices"=>[90, 98]}],
    "symbols"=>[],
    "user_mentions"=>
     [{"screen_name"=>"NBCMarryMe", "name"=>"Marry Me", "id"=>2396412661, "id_str"=>"2396412661", "indices"=>[3, 14]},
      {"screen_name"=>"nbc", "name"=>"NBC", "id"=>26585095, "id_str"=>"26585095", "indices"=>[123, 127]}],
    "urls"=>[],
    "media"=>
     [{"id"=>541668713209286656,
       "id_str"=>"541668713209286656",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
       "url"=>"http://t.co/ap8oHUvjbw",
       "display_url"=>"pic.twitter.com/ap8oHUvjbw",
       "expanded_url"=>"http://twitter.com/NBCMarryMe/status/541668713712594945/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1000, "h"=>500, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>300, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>170, "resize"=>"fit"}},
       "source_status_id"=>541668713712594945,
       "source_status_id_str"=>"541668713712594945",
       "source_user_id"=>2396412661,
       "source_user_id_str"=>"2396412661"}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541668713209286656,
       "id_str"=>"541668713209286656",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4Rk0yTIUAAYIFu.jpg",
       "url"=>"http://t.co/ap8oHUvjbw",
       "display_url"=>"pic.twitter.com/ap8oHUvjbw",
       "expanded_url"=>"http://twitter.com/NBCMarryMe/status/541668713712594945/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1000, "h"=>500, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>300, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>170, "resize"=>"fit"}},
       "source_status_id"=>541668713712594945,
       "source_status_id_str"=>"541668713712594945",
       "source_user_id"=>2396412661,
       "source_user_id_str"=>"2396412661"}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:10:20 +0000 2014",
  "id"=>541686166849093632,
  "id_str"=>"541686166849093632",
  "text"=>"We need to stop thinking that career development and advancement are synonymous http://t.co/xPW7p1wxuy",
  "source"=>"<a href=\"http://www.socialflow.com\" rel=\"nofollow\">SocialFlow</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2735591,
    "id_str"=>"2735591",
    "name"=>"Fast Company",
    "screen_name"=>"FastCompany",
    "location"=>"New York, NY",
    "profile_location"=>nil,
    "description"=>
     "Official Twitter feed for the Fast Company business media brand;  inspiring readers to think beyond traditional boundaries & create the future of business.",
    "url"=>"http://t.co/GBtvUq9rZp",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/GBtvUq9rZp", "expanded_url"=>"http://www.fastcompany.com", "display_url"=>"fastcompany.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1609050,
    "friends_count"=>3930,
    "listed_count"=>37240,
    "created_at"=>"Wed Mar 28 22:39:21 +0000 2007",
    "favourites_count"=>1665,
    "utc_offset"=>-18000,
    "time_zone"=>"Eastern Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>93789,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>true,
    "profile_background_color"=>"FFFFFF",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/425029708/2048x1600-fc-twitter-backgrd.png",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/425029708/2048x1600-fc-twitter-backgrd.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/435840321952288770/IaWfR33b_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/435840321952288770/IaWfR33b_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2735591/1416233672",
    "profile_link_color"=>"9AB2B4",
    "profile_sidebar_border_color"=>"5A5A5A",
    "profile_sidebar_fill_color"=>"CCCCCC",
    "profile_text_color"=>"000000",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>16,
  "favorite_count"=>32,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>[{"url"=>"http://t.co/xPW7p1wxuy", "expanded_url"=>"http://f-st.co/udV6WTy", "display_url"=>"f-st.co/udV6WTy", "indices"=>[80, 102]}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:10:08 +0000 2014",
  "id"=>541686114965540865,
  "id_str"=>"541686114965540865",
  "text"=>"David Sedaris went all-out with his outfit choice: https://t.co/z4HnCGTxsJ http://t.co/Qq3jb7ernd",
  "source"=>"<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">Hootsuite</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>19777398,
    "id_str"=>"19777398",
    "name"=>"Fallon Tonight",
    "screen_name"=>"FallonTonight",
    "location"=>"Weeknights 11:35/10:35c",
    "profile_location"=>nil,
    "description"=>
     "The official Twitter for Tonight Show Starring Jimmy Fallon on @NBC.\n   (Tweets by: @marinarachael @christinefriar @thatsso_rachael @NoahGeb) #FallonTonight",
    "url"=>"http://t.co/fgp5RYqr3T",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/fgp5RYqr3T", "expanded_url"=>"http://www.tonightshow.com", "display_url"=>"tonightshow.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1860900,
    "friends_count"=>14761,
    "listed_count"=>6984,
    "created_at"=>"Fri Jan 30 17:26:46 +0000 2009",
    "favourites_count"=>57272,
    "utc_offset"=>-21600,
    "time_zone"=>"Central Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>29045,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"03253E",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/432922341345988609/3BSxlqQE.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/432922341345988609/3BSxlqQE.jpeg",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/432921867259613184/q89H1EeV_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/432921867259613184/q89H1EeV_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/19777398/1401723954",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"DDFFCC",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>15,
  "favorite_count"=>46,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"https://t.co/z4HnCGTxsJ",
       "expanded_url"=>"https://www.youtube.com/watch?v=XXbmbqfJDMI&list=UU8-Th83bH_thdKZDJCrn88g",
       "display_url"=>"youtube.com/watch?v=XXbmbq…",
       "indices"=>[51, 74]},
      {"url"=>"http://t.co/Qq3jb7ernd",
       "expanded_url"=>"http://twitter.com/FallonTonight/status/541686114965540865/photo/1",
       "display_url"=>"pic.twitter.com/Qq3jb7ernd",
       "indices"=>[75, 97]}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:10:01 +0000 2014",
  "id"=>541686084438990850,
  "id_str"=>"541686084438990850",
  "text"=>"Up to 50% off prints when you order a custom design! Visit http://t.co/hbRQbo5BxR 34 http://t.co/Rm1z16mNGd",
  "source"=>"<a href=\"http://tweetadder.com\" rel=\"nofollow\">TweetAdder v4</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>2239497745,
    "id_str"=>"2239497745",
    "name"=>"SiegePrints.com",
    "screen_name"=>"AmberG1301",
    "location"=>"",
    "profile_location"=>nil,
    "description"=>"50% Off business card prints when you order a custom design. Learn more at http://t.co/31K65WMMy2",
    "url"=>"http://t.co/KB2edu5ZCS",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/KB2edu5ZCS", "expanded_url"=>"http://www.siegeprints.com", "display_url"=>"siegeprints.com", "indices"=>[0, 22]}]},
      "description"=>
       {"urls"=>
         [{"url"=>"http://t.co/31K65WMMy2",
           "expanded_url"=>"http://www.siegeprints.com/Specials.html",
           "display_url"=>"siegeprints.com/Specials.html",
           "indices"=>[75, 97]}]}},
    "protected"=>false,
    "followers_count"=>17090,
    "friends_count"=>13000,
    "listed_count"=>30,
    "created_at"=>"Tue Dec 10 17:08:48 +0000 2013",
    "favourites_count"=>1,
    "utc_offset"=>-25200,
    "time_zone"=>"Arizona",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>15006,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"C0DEED",
    "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/469643964295827456/m_NwVsW4_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2239497745/1415848766",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"C0DEED",
    "profile_sidebar_fill_color"=>"DDEEF6",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>true,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweet_count"=>0,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[],
    "urls"=>
     [{"url"=>"http://t.co/hbRQbo5BxR", "expanded_url"=>"http://www.siegeprints.com/specials.html", "display_url"=>"siegeprints.com/specials.html", "indices"=>[59, 81]}],
    "media"=>
     [{"id"=>541686084195729408,
       "id_str"=>"541686084195729408",
       "indices"=>[85, 107],
       "media_url"=>"http://pbs.twimg.com/media/B4R0n6RCQAAhUJW.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R0n6RCQAAhUJW.png",
       "url"=>"http://t.co/Rm1z16mNGd",
       "display_url"=>"pic.twitter.com/Rm1z16mNGd",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541686084438990850/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541686084195729408,
       "id_str"=>"541686084195729408",
       "indices"=>[85, 107],
       "media_url"=>"http://pbs.twimg.com/media/B4R0n6RCQAAhUJW.png",
       "media_url_https"=>"https://pbs.twimg.com/media/B4R0n6RCQAAhUJW.png",
       "url"=>"http://t.co/Rm1z16mNGd",
       "display_url"=>"pic.twitter.com/Rm1z16mNGd",
       "expanded_url"=>"http://twitter.com/AmberG1301/status/541686084438990850/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"large"=>{"w"=>1024, "h"=>535, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>314, "resize"=>"fit"},
         "small"=>{"w"=>340, "h"=>177, "resize"=>"fit"}}}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:09:55 +0000 2014",
  "id"=>541686060095651840,
  "id_str"=>"541686060095651840",
  "text"=>"RT @StereoreyMX: How does it feel to be without home, like a complete unknown, like a rolling stone? ♫",
  "source"=>"<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>22891326,
    "id_str"=>"22891326",
    "name"=>"Jose Ramon Marquez",
    "screen_name"=>"joseramonmarmtz",
    "location"=>"Aguascalientes, Mexico",
    "profile_location"=>nil,
    "description"=>"Fan of Coca-Cola, The Tonight Show starring Jimmy Fallon, Late Night with Seth Meyers, SNL and many more TV shows.",
    "url"=>"http://t.co/9lh90BLhAU",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/9lh90BLhAU", "expanded_url"=>"http://cokesnlfan.tumblr.com", "display_url"=>"cokesnlfan.tumblr.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>1910,
    "friends_count"=>853,
    "listed_count"=>23,
    "created_at"=>"Thu Mar 05 06:44:29 +0000 2009",
    "favourites_count"=>18152,
    "utc_offset"=>-21600,
    "time_zone"=>"Central Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>false,
    "statuses_count"=>97736,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"B2DFDA",
    "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/539988582807519232/rNRMfGGw.jpeg",
    "profile_background_tile"=>true,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/488924614735589377/DnK0Xzn9_normal.jpeg",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/22891326/1409898695",
    "profile_link_color"=>"93A644",
    "profile_sidebar_border_color"=>"000000",
    "profile_sidebar_fill_color"=>"C0DFEC",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 19:33:13 +0000 2014",
    "id"=>541676825198354432,
    "id_str"=>"541676825198354432",
    "text"=>"How does it feel to be without home, like a complete unknown, like a rolling stone? ♫",
    "source"=>"<a href=\"https://about.twitter.com/products/tweetdeck\" rel=\"nofollow\">TweetDeck</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>2280959780,
      "id_str"=>"2280959780",
      "name"=>"Stereorey",
      "screen_name"=>"StereoreyMX",
      "location"=>"",
      "profile_location"=>nil,
      "description"=>"",
      "url"=>nil,
      "entities"=>{"description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>12997,
      "friends_count"=>964,
      "listed_count"=>5,
      "created_at"=>"Tue Jan 07 17:53:18 +0000 2014",
      "favourites_count"=>4,
      "utc_offset"=>nil,
      "time_zone"=>nil,
      "geo_enabled"=>false,
      "verified"=>false,
      "statuses_count"=>447,
      "lang"=>"es",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"000000",
      "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/456172723626971137/8iAJgGUs.jpeg",
      "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/456172723626971137/8iAJgGUs.jpeg",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/509836948496588800/e_Div3EV_normal.png",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/509836948496588800/e_Div3EV_normal.png",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/2280959780/1410389595",
      "profile_link_color"=>"0084B4",
      "profile_sidebar_border_color"=>"FFFFFF",
      "profile_sidebar_fill_color"=>"DDEEF6",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>false,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>1,
    "favorite_count"=>1,
    "entities"=>{"hashtags"=>[], "symbols"=>[], "user_mentions"=>[], "urls"=>[]},
    "favorited"=>false,
    "retweeted"=>false,
    "lang"=>"en"},
  "retweet_count"=>1,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>[{"screen_name"=>"StereoreyMX", "name"=>"Stereorey", "id"=>2280959780, "id_str"=>"2280959780", "indices"=>[3, 15]}],
    "urls"=>[]},
  "favorited"=>false,
  "retweeted"=>false,
  "lang"=>"en"},
 {"created_at"=>"Sun Dec 07 20:09:40 +0000 2014",
  "id"=>541685998670073856,
  "id_str"=>"541685998670073856",
  "text"=>"RT @FL_Creativity: Really inspired by this quote from @TomKelley74 at @ideo. It's easy to find serendipity if you're receptive to it! http:…",
  "source"=>"<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
  "truncated"=>false,
  "in_reply_to_status_id"=>nil,
  "in_reply_to_status_id_str"=>nil,
  "in_reply_to_user_id"=>nil,
  "in_reply_to_user_id_str"=>nil,
  "in_reply_to_screen_name"=>nil,
  "user"=>
   {"id"=>23462787,
    "id_str"=>"23462787",
    "name"=>"IDEO",
    "screen_name"=>"ideo",
    "location"=>"",
    "profile_location"=>nil,
    "description"=>"We are a global design consultancy. We create impact through design.",
    "url"=>"http://t.co/pbwwgZrwZH",
    "entities"=>
     {"url"=>{"urls"=>[{"url"=>"http://t.co/pbwwgZrwZH", "expanded_url"=>"http://www.ideo.com", "display_url"=>"ideo.com", "indices"=>[0, 22]}]},
      "description"=>{"urls"=>[]}},
    "protected"=>false,
    "followers_count"=>200758,
    "friends_count"=>2600,
    "listed_count"=>7173,
    "created_at"=>"Mon Mar 09 17:27:15 +0000 2009",
    "favourites_count"=>2145,
    "utc_offset"=>-28800,
    "time_zone"=>"Pacific Time (US & Canada)",
    "geo_enabled"=>false,
    "verified"=>true,
    "statuses_count"=>3197,
    "lang"=>"en",
    "contributors_enabled"=>false,
    "is_translator"=>false,
    "is_translation_enabled"=>false,
    "profile_background_color"=>"022330",
    "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme15/bg.png",
    "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme15/bg.png",
    "profile_background_tile"=>false,
    "profile_image_url"=>"http://pbs.twimg.com/profile_images/433682028823707648/2mGokFUg_normal.png",
    "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/433682028823707648/2mGokFUg_normal.png",
    "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/23462787/1361896977",
    "profile_link_color"=>"0084B4",
    "profile_sidebar_border_color"=>"FFFFFF",
    "profile_sidebar_fill_color"=>"C0DFEC",
    "profile_text_color"=>"333333",
    "profile_use_background_image"=>true,
    "default_profile"=>false,
    "default_profile_image"=>false,
    "following"=>true,
    "follow_request_sent"=>false,
    "notifications"=>false},
  "geo"=>nil,
  "coordinates"=>nil,
  "place"=>nil,
  "contributors"=>nil,
  "retweeted_status"=>
   {"created_at"=>"Sun Dec 07 02:50:07 +0000 2014",
    "id"=>541424385908035584,
    "id_str"=>"541424385908035584",
    "text"=>"Really inspired by this quote from @TomKelley74 at @ideo. It's easy to find serendipity if you're receptive to it! http://t.co/2xv2QDEl60",
    "source"=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
    "truncated"=>false,
    "in_reply_to_status_id"=>nil,
    "in_reply_to_status_id_str"=>nil,
    "in_reply_to_user_id"=>nil,
    "in_reply_to_user_id_str"=>nil,
    "in_reply_to_screen_name"=>nil,
    "user"=>
     {"id"=>979658575,
      "id_str"=>"979658575",
      "name"=>"FLcreativity",
      "screen_name"=>"FL_Creativity",
      "location"=>"Sarasota, Florida",
      "profile_location"=>nil,
      "description"=>
       "Ignite your imagination at the 12th Annual Florida Creativity Weekend, Mar. 20-22, 2015. Hosted by: FL Creativity Alliance, USFSM & FL Studio Theater.",
      "url"=>"http://t.co/bfgDSEun",
      "entities"=>
       {"url"=>{"urls"=>[{"url"=>"http://t.co/bfgDSEun", "expanded_url"=>"http://FLcreativity.com", "display_url"=>"FLcreativity.com", "indices"=>[0, 20]}]},
        "description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>170,
      "friends_count"=>478,
      "listed_count"=>5,
      "created_at"=>"Fri Nov 30 03:19:06 +0000 2012",
      "favourites_count"=>23,
      "utc_offset"=>-18000,
      "time_zone"=>"Eastern Time (US & Canada)",
      "geo_enabled"=>false,
      "verified"=>false,
      "statuses_count"=>157,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"F2FFBF",
      "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/531875085166985217/zej5Fwul.png",
      "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/531875085166985217/zej5Fwul.png",
      "profile_background_tile"=>true,
      "profile_image_url"=>"http://pbs.twimg.com/profile_images/531869584005935105/7XjBXoT-_normal.png",
      "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/531869584005935105/7XjBXoT-_normal.png",
      "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/979658575/1415686254",
      "profile_link_color"=>"FA743E",
      "profile_sidebar_border_color"=>"FFFFFF",
      "profile_sidebar_fill_color"=>"74D377",
      "profile_text_color"=>"5CBABC",
      "profile_use_background_image"=>true,
      "default_profile"=>false,
      "default_profile_image"=>false,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
    "geo"=>nil,
    "coordinates"=>nil,
    "place"=>nil,
    "contributors"=>nil,
    "retweet_count"=>4,
    "favorite_count"=>7,
    "entities"=>
     {"hashtags"=>[],
      "symbols"=>[],
      "user_mentions"=>
       [{"screen_name"=>"TomKelley74", "name"=>"Tom Kelley", "id"=>589570858, "id_str"=>"589570858", "indices"=>[35, 47]},
        {"screen_name"=>"ideo", "name"=>"IDEO", "id"=>23462787, "id_str"=>"23462787", "indices"=>[51, 56]}],
      "urls"=>[],
      "media"=>
       [{"id"=>541424379285225472,
         "id_str"=>"541424379285225472",
         "indices"=>[115, 137],
         "media_url"=>"http://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
         "url"=>"http://t.co/2xv2QDEl60",
         "display_url"=>"pic.twitter.com/2xv2QDEl60",
         "expanded_url"=>"http://twitter.com/FL_Creativity/status/541424385908035584/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"small"=>{"w"=>340, "h"=>340, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "medium"=>{"w"=>600, "h"=>600, "resize"=>"fit"},
           "large"=>{"w"=>1024, "h"=>1024, "resize"=>"fit"}}}]},
    "extended_entities"=>
     {"media"=>
       [{"id"=>541424379285225472,
         "id_str"=>"541424379285225472",
         "indices"=>[115, 137],
         "media_url"=>"http://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
         "media_url_https"=>"https://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
         "url"=>"http://t.co/2xv2QDEl60",
         "display_url"=>"pic.twitter.com/2xv2QDEl60",
         "expanded_url"=>"http://twitter.com/FL_Creativity/status/541424385908035584/photo/1",
         "type"=>"photo",
         "sizes"=>
          {"small"=>{"w"=>340, "h"=>340, "resize"=>"fit"},
           "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
           "medium"=>{"w"=>600, "h"=>600, "resize"=>"fit"},
           "large"=>{"w"=>1024, "h"=>1024, "resize"=>"fit"}}}]},
    "favorited"=>false,
    "retweeted"=>false,
    "possibly_sensitive"=>false,
    "lang"=>"en"},
  "retweet_count"=>4,
  "favorite_count"=>0,
  "entities"=>
   {"hashtags"=>[],
    "symbols"=>[],
    "user_mentions"=>
     [{"screen_name"=>"FL_Creativity", "name"=>"FLcreativity", "id"=>979658575, "id_str"=>"979658575", "indices"=>[3, 17]},
      {"screen_name"=>"TomKelley74", "name"=>"Tom Kelley", "id"=>589570858, "id_str"=>"589570858", "indices"=>[54, 66]},
      {"screen_name"=>"ideo", "name"=>"IDEO", "id"=>23462787, "id_str"=>"23462787", "indices"=>[70, 75]}],
    "urls"=>[],
    "media"=>
     [{"id"=>541424379285225472,
       "id_str"=>"541424379285225472",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
       "url"=>"http://t.co/2xv2QDEl60",
       "display_url"=>"pic.twitter.com/2xv2QDEl60",
       "expanded_url"=>"http://twitter.com/FL_Creativity/status/541424385908035584/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>340, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>600, "resize"=>"fit"},
         "large"=>{"w"=>1024, "h"=>1024, "resize"=>"fit"}},
       "source_status_id"=>541424385908035584,
       "source_status_id_str"=>"541424385908035584",
       "source_user_id"=>979658575,
       "source_user_id_str"=>"979658575"}]},
  "extended_entities"=>
   {"media"=>
     [{"id"=>541424379285225472,
       "id_str"=>"541424379285225472",
       "indices"=>[139, 140],
       "media_url"=>"http://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
       "media_url_https"=>"https://pbs.twimg.com/media/B4OGmrgIQAAs8bK.jpg",
       "url"=>"http://t.co/2xv2QDEl60",
       "display_url"=>"pic.twitter.com/2xv2QDEl60",
       "expanded_url"=>"http://twitter.com/FL_Creativity/status/541424385908035584/photo/1",
       "type"=>"photo",
       "sizes"=>
        {"small"=>{"w"=>340, "h"=>340, "resize"=>"fit"},
         "thumb"=>{"w"=>150, "h"=>150, "resize"=>"crop"},
         "medium"=>{"w"=>600, "h"=>600, "resize"=>"fit"},
         "large"=>{"w"=>1024, "h"=>1024, "resize"=>"fit"}},
       "source_status_id"=>541424385908035584,
       "source_status_id_str"=>"541424385908035584",
       "source_user_id"=>979658575,
       "source_user_id_str"=>"979658575"}]},
  "favorited"=>false,
  "retweeted"=>false,
  "possibly_sensitive"=>false,
  "lang"=>"en"}]
[6] pry(main)> 
