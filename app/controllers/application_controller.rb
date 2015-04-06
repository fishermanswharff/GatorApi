class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by(token: session[:current_user_id])
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
