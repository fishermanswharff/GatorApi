require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'

describe 'Omniauth Callbacks Controller' do

  let(:provider) do
    'twitter'
  end
  context 'User has not authorized Gator to the provider' do
    before(:each) do
      User.destroy_all
      AuthenticationProvider.destroy_all
      UserAuthentication.destroy_all
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
      it 'filters the provider and token, sends request for token' do
        post "/users/auth/#{provider}",{},{'HTTP_AUTHORIZATION' => "Token token=#{@user.token}"}
        expect(response.status).to eq 202
        params = json(response.body)
        expect(params.length).to eq 2
        expect(params[:token]).not_to be nil
        expect(params[:secret]).not_to be nil
      end
    end

    describe '#twitter_callback' do
      it 'receives the twitter callback and parses the params out of the fullpath' do
        post '/users/auth/twitter/callback?user-token=7a2ab5a8677b446eb1c269c5056a001d&provider=twitter&oauth_token=vXRrcMnxtT52Pf0suKaHsW67I8V0tV03&oauth_verifier=cBaabHkbVCwMlpUbrIYJ1XT7sHPUxXSi'
        expect(response.status).to be 302
        expect(response.body).to eq "<html><body>You are being <a href=\"http://localhost:9000\">redirected</a>.</body></html>"
      end
    end
  end

  context 'User has previously authorized Gator to the provider' do

    before(:each) do
      User.destroy_all
      AuthenticationProvider.destroy_all
      UserAuthentication.destroy_all
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
      AuthenticationProvider.create(name: 'twitter')
      UserAuthentication.create_from_omniauth({"oauth_token"=>"20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", "oauth_token_secret"=>"HTeYHJENqAxMq6BV1lcMBNkcwlvKP9PjJB8VjtJ1p66ur", "user_id"=>"20350433", "screen_name"=>"jasonwharff"}, @user, 'twitter')
    end

    describe '#passthru' do
      it 'checks to see if a user authentication exists for that user and the provider' do
        post "/users/auth/#{provider}",{},{'HTTP_AUTHORIZATION' => "Token token=#{@user.token}"}
        expect(response.status).to be 203
        hash = JSON.parse(response.body)
        expect(hash['message']).to eq 'You are logged in'
        expect(hash['screenname']).to eq 'jasonwharff'
      end
    end
  end
end