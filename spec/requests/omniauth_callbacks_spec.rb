require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'

describe 'Omniauth Callbacks Controller' do

  let(:provider) { 'twitter' }

  context 'User has not authorized Gator to the provider' do
    before(:each) do
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

    # TODO: stub out response so we're not pinging twitter
    describe '#twitter_callback' do
      it 'receives the twitter callback and parses the params out of the fullpath' do
        # post '/users/auth/twitter/callback?user-token=7a2ab5a8677b446eb1c269c5056a001d&provider=twitter&oauth_token=DokqxLiI0WySCVECDTHO2OT7EBv1xwk1&oauth_verifier=dPc4RODcgEGSL8appKuwc8GJXkPkjppK'
        # expect(response.status).to be 302
        # expect(response.body).to eq "<html><body>You are being <a href=\"http://localhost:9000/#/social?provider=twitter&amp;screenname=jasonwharff&amp;user-id=20350433\">redirected</a>.</body></html>"
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
      UserAuthentication.create_from_omniauth({"oauth_token"=>"#{ENV['TWITTER_ACCESS_TOKEN']}", "oauth_token_secret"=>"#{ENV['TWITTER_ACCESS_SECRET']}", "user_id"=>"20350433", "screen_name"=>"jasonwharff"}, @user, 'twitter')
    end

    describe '#passthru' do
      it 'checks to see if a user authentication exists for that user and the provider' do
        post "/users/auth/#{provider}",{},{'HTTP_AUTHORIZATION' => "Token token=#{@user.token}"}
        expect(response.status).to be 203
        hash = JSON.parse(response.body)
        expect(hash['message']).to eq 'You are logged in'
        expect(hash['screenname']).to eq 'jasonwharff'
        expect(hash['user_id']).to eq '20350433'
        expect(hash['provider']).to eq 'twitter'
      end
    end
  end
end
