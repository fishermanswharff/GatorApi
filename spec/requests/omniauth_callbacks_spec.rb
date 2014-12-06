require 'rails_helper'
require 'spec_helper'

describe 'Omniauth Callbacks Controller' do

  describe '#passthru' do
    let(:provider) do
      'twitter'
    end
    before(:each) do
      post "/users/auth/#{provider}",{}
    end

    it 'responds successfully' do
      # I expect this get request to send a request to twitters request token endpoint, and return
      # a token: https://api.twitter.com/oauth/request_token
      expect(response.status).to eq 200
    end

    it 'routes to the appropriate provider' do
      expect(request.filtered_parameters['provider']).to eq 'twitter'
    end

    
  end
  
end