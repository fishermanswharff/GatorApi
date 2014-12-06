class Users::OmniauthCallbacksController < ApplicationController

  def passthru
    binding.byebug
    # token = request.params['token']
    # provider = request.filtered_parameters['provider']
    # user = User.where(token: @token)[0]
  end

  # I expect this get request to route a request to twitter's 
  # request_token endpoint, and return a token: 
  # https://api.twitter.com/oauth/request_token
  # which then gets used to authorize Gator,
  # which results in a params hash returned from twitter,
  # which should get saved as a UserAuthentication on the user

  
end


