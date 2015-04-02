require Rails.root.join('lib/modules/OAuth')
class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    @user_token = request.headers['HTTP_AUTHORIZATION'].gsub(/Token token=/,'')
    @provider = request.filtered_parameters['provider']

    user = User.where(token: @user_token)
    authentications = UserAuthentication.where(user: user).map { |i| i if i.authentication_provider.name == @provider }
    if authentications.length > 0
      # need to send an authorization request to Twitter with the saved authentication
    else
      request_token(@provider, @user_token)
    end
  end

  def request_token(provider, user_token)
    @request = OAuth::RequestToken.new(provider,user_token)
    response = @request.request_data(@request.get_header_string,@request.get_base_url,@request.get_method)
    token_param = strip_token(response.body)
    token_secret_param = response.body.scan(/oauth_token_secret=\w+/)[0]
    render json: { token: token_param, secret: token_secret_param }, status: 200
  end

  def twitter_callback
    fullpath = request.fullpath
    token_params = strip_token(fullpath)
    oauth_verifier = strip_verifier(fullpath)
    user_token = strip_user_token(fullpath)
    @request = OAuth::AccessToken.new('twitter',{params: token_params + '&' + oauth_verifier})
    response = @request.request_data(@request.get_header_string,@request.get_base_url, @request.get_method,@request.data)
    @user = User.find_by(token: params['user-token'])
    hash = convertToHash(response.body)
    UserAuthentication.create_from_omniauth(hash, @user, params["provider"])
    redirect_to ENV['WEB_APP_URL']
  end

  private

  def convertToHash(string)
    string.split('&').each_with_object({}) { |i,o|
      array = i.split('=')
      o[array[0]] = array[1]
    }
  end

  def strip_token(string)
    string.scan(/oauth_token=\w+/)[0]
  end

  def strip_verifier(string)
    string.scan(/oauth_verifier=\w+/)[0]
  end

  def strip_user_token(string)
    string.scan(/(?:user-token=)(\w+)/)[0][0]
  end

  def strip_authorized_token(string)
    string.scan(/(?:oauth_token=)([\w\-]+)/)[0][0]
  end

  def strip_token_secret(string)
    string.scan(/(?:oauth_token_secret=)(\w+)/)[0][0]
  end

  def strip_user_id(string)
    string.scan(/(?:user_id=)(\d+)/)[0][0]
  end

  def strip_screen_name(string)
    string.scan(/(?:screen_name=)(.+)/)[0][0]
  end
end