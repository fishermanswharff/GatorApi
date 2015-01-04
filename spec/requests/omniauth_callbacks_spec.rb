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

  describe '#passthru and #request_token' do
    let(:provider) do
      'twitter'
    end
    it 'filters the provider and token, sends request for token' do
      post "/users/auth/#{:provider}",{ "token" => @user.token }
      expect(response.status).to eq 200
      params = json(response.body)
      expect(params.length).to eq 2
      p params
    end
  end
end













