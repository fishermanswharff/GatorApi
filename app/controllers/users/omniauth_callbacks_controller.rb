class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    @token = request.params['token']
    @provider = request.filtered_parameters['provider']
    @user = User.where(token: @token)[0]
    route_to_provider
  end

  def route_to_provider
    prepare_twitter_access_token() if @provider == 'twitter'
  end

  def prepare_twitter_access_token(oauth_token, oauth_token_secret, callback_url)
    @callback_url = callback_url
    consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { :site => "https://api.twitter.com", :scheme => :header })
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    
    binding.byebug

    return access_token
  end
  # I expect the passthru action to route a request to a provider's
  # request_token endpoint, and return a token: 
  # https://api.twitter.com/oauth/request_token
  # which then gets used to authorize Gator,
  # which results in a params hash returned from provider,
  # which should get saved as a UserAuthentication on the user
end