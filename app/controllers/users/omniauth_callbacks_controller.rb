require Rails.root.join('lib/modules/OAuth')
class Users::OmniauthCallbacksController < ApplicationController

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
    # which should return something like this in the body:
    # oauth_token=20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6&oauth_token_secret=HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur&user_id=20350433&screen_name=jasonwharff
    # at this point, UserAuthentication kicks in and creates from omniauth
  end

  def strip_token(string)
    string.scan(/oauth_token=\w+/)[0]
  end

  def strip_verifier(string)
    string.scan(/oauth_verifier=\w+/)[0]
  end
end