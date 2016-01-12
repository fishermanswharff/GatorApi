require Rails.root.join('lib/modules/OAuth')
class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    @user_token = request.headers['HTTP_AUTHORIZATION'].gsub(/Token token=/,'')
    @provider = request.filtered_parameters['provider']
    user = User.where(token: @user_token)
    # there should be a query for this
    authentications = UserAuthentication.where(user: user).map { |i| i if i.authentication_provider.name == @provider }
    if authentications.length > 0
      render json: { message: 'You are logged in', screenname: authentications[0].params['screen_name'], user_id: authentications[0].params['user_id'], provider: @provider  }, status: 203
    else
      request_token(@provider, @user_token)
    end
  end

  def request_token(provider, user_token)
    @request = OAuth::RequestToken.new(provider,user_token)
    response = @request.request_data(OAuth.get_header_string('request_token',@request.params),OAuth.get_base_url('request_token'),OAuth.get_method)
    Rails.logger.debug "—————————————— Header string: #{OAuth.get_header_string('request_token',@request.params)} ——————————————"
    Rails.logger.debug "—————————————— twitter response: #{response.body} ——————————————"
    token_param = strip_token(response.body)
    token_secret_param = strip_token_secret(response.body)
    render json: { token: token_param, secret: token_secret_param }, status: 202
  end

  def twitter_callback
    fullpath = request.fullpath
    @request = OAuth::AccessToken.new('twitter',{ params: strip_token(fullpath) + '&' + strip_verifier(fullpath) })
    response = @request.request_data(OAuth.get_header_string('access_token',@request.params),OAuth.get_base_url('access_token'), OAuth.get_method,@request.data)
    @user = User.find_by(token: params['user-token'])
    obj = convertToHash(response.body)
    if response.code.to_i < 300
      UserAuthentication.create_from_omniauth(obj, @user, params["provider"])
      redirect_to ENV['WEB_APP_URL'] + "?provider=#{params["provider"]}&screenname=#{obj['screen_name']}&user-id=#{obj['user_id']}"
    else
      redirect_to ENV['WEB_APP_URL']
    end
  end

  private

  def convertToHash(string)
    string.split('&').each_with_object({}) { |i,o|
      array = i.split('=')
      o[array[0]] = array[1]
    }
  end

  def strip_token(string)
    string.split('&').detect { |param| param.include? 'oauth_token' }
  end

  def strip_token_secret(string)
    string.split('&').detect { |param| param.include? 'oauth_token_secret' }
  end

  def strip_verifier(string)
    string.split('&').detect { |param| param.include? 'oauth_verifier' }
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
