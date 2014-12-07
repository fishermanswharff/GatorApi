require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'

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

    # I expect passthru to act as a filter by parsing parameters and routing the 
    # oauth requests to the appropriate model

    let(:provider) do
      'twitter'
    end

    before(:each) do
      post "/users/auth/#{provider}",{ "token" => @user.token }
    end

    it 'responds successfully' do
      expect(response.status).to eq 200
    end

    it 'routes to the appropriate provider' do
      expect(request.filtered_parameters['provider']).to eq provider
    end

    it 'has a token from the authenticated user' do
      expect(request.params['token']).to eq @user.token
    end
  end

  describe '#route_to_provider' do
    before(:all) do
      
    end
    
    it 'routes the request to the appropriate provider' do
      expect(response.status).to eq 200
    end
  end
end













