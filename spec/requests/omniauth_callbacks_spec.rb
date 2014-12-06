require 'rails_helper'
require 'spec_helper'

describe 'Omniauth Callbacks Controller' do

  before(:each) do
      User.delete_all
      @user = User.create(
        { 
          first_name: 'foo',
          last_name: 'bar',
          username: 'foo',
          role: 'generic',
          email: 'foo@bar.com',
          password: 'secret'
        }
      )
      post '/login',{ username: "foo", password: "secret" }
    end

  describe '#passthru' do
    
    # I expect this get request to send a request to twitter's request token endpoint, and return
    # a token: https://api.twitter.com/oauth/request_token

    let(:provider) do
      'twitter'
    end

    before(:each) do
      post "/users/auth/#{provider}",{}
    end

    it 'responds successfully' do
      
      expect(response.status).to eq 200
    end

    it 'routes to the appropriate provider' do
      expect(request.filtered_parameters['provider']).to eq provider
    end

  end
  
end