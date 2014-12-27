class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    @token = request.params['token']
    @provider = request.filtered_parameters['provider']
    @user = User.where(token: @token)[0]
    route_to_provider
  end

  def route_to_provider
    prepare_twitter_access_token(ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_ACCESS_SECRET"], 'http://127.0.0.1/users/auth/twitter/callback') if @provider == 'twitter'
  end

  def prepare_twitter_access_token(oauth_token, oauth_token_secret, callback_url)
    
    binding.byebug
    @callback_url = callback_url
    @consumer = OAuth::Consumer.new(oauth_token, oauth_token_secret, :site => "https://api.twitter.com/oauth/request_token")
    @request_token = @consumer.get_request_token(:oauth_callback => @callback_url) #=> this needs to be a post request to https://api.twitter.com/oauth/request_token with an Authorization header containing the app's oauth token and token secret
  end

  def get_request_token(call_back_url)

  end

  # consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header })
  # token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
  # access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
  # request_token(access_token)
  # return access_token
  # uri = URI("https://api.twitter.com/oauth/request_token")
  # http = Net::HTTP.new(uri.host,uri.port,initheader = {'Content-Type' =>'application/json', :use_ssl => uri.scheme == 'https'})
  # req = Net::HTTP::Post.new uri
  # req['Authorization'] = access_token


  # I expect the passthru action to route a request to a provider's
  # request_token endpoint, and return a token: 
  # https://api.twitter.com/oauth/request_token
  # which then gets used to authorize Gator,
  # which results in a params hash returned from provider,
  # which should get saved as a UserAuthentication on the user
end