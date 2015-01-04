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
    token_param = strip_token(response.body)
    token_secret_param = response.body.scan(/oauth_token_secret=\w+/)[0]
    render json: { token: token_param, secret: token_secret_param }, status: 200
  end

  def get_authentication(token_params)
    @get_auth = OAuth::Authentication.get_authentication("https://api.twitter.com/oauth/authenticate",token_params)
  end

  def twitter_callback
    fullpath = response.request.fullpath
    token_params = strip_token(fullpath)
    oauth_verifier = strip_verifier(fullpath)
    # here I need to pass the token and verifier into OAuth::AccessToken.new()
    binding.byebug
  end

  def strip_token(string)
    string.scan(/oauth_token=\w+/)[0]
  end

  def strip_verifier(string)
    string.scan(/oauth_verifier=\w+/)[0]
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