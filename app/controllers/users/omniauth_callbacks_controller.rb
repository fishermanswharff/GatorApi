require Rails.root.join('lib/modules/OAuth')
class Users::OmniauthCallbacksController < ApplicationController

  # attr_accessor :token, :provider, :request

  def passthru
    @token = request.params['token']
    @provider = request.filtered_parameters['provider']
    request_token(@provider)
  end

  def request_token(provider)
    @request = OAuth::RequestToken.new(@provider)
    response = @request.request_data(@request.get_header_string,@request.get_base_url,@request.get_method)
    # @oauth_token = response.body.filtered_parameters['oauth_token']
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
  # which returns an unauthorized oauth token and oauth secret
  # then redirect the user, along with their oauth token and secret to provider to authorize
  # which results in a params hash returned from provider upon successful authorization
  # which should get saved as a UserAuthentication on the user
end