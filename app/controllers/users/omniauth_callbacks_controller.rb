class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    @token = request.params['token']
    @provider = request.filtered_parameters['provider']
    @user = User.where(token: @token)[0]
    route_to_provider
  end

  def route_to_provider
    # binding.byebug
  end
  # I expect the passthru action to route a request to a provider's
  # request_token endpoint, and return a token: 
  # https://api.twitter.com/oauth/request_token
  # which then gets used to authorize Gator,
  # which results in a params hash returned from provider,
  # which should get saved as a UserAuthentication on the user
end