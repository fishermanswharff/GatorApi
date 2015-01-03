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

    let(:provider) do
      'twitter'
    end

    before(:each) do
      post "/users/auth/#{provider}",{ "token" => @user.token }
    end

    it 'gets the filters out the provider' do
      
    end
  end
end













