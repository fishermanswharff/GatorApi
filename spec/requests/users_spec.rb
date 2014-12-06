require 'rails_helper'
require 'spec_helper'

describe 'User API Endpoint' do

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
  end

  describe '#login' do
    before(:each) do
      post '/login',{ username: "foo", password: "secret" }
    end

    it 'has valid authentication with token' do
      expect(response.status).to eq 200
    end

    it 'responds with valid JSON' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'refuses invalid authentication' do
      post '/login',{ username: "foo", password: "bar" }
      expect(response.status).to eq 401
    end
  end

  describe '#logout' do
    before(:each) do
      post '/login',{ username: "foo", password: "secret" }
      get '/logout'
    end
    it 'logs the user out' do
      expect(response.status).to eq 200
    end
    it 'returns only a response header' do
      expect(response.body).to eq " "
    end
  end

  describe '#index' do
    it 'retrieves all of the users' do
      get '/users'
      expect(response).to be_success
    end

    it 'returns valid json' do
      get '/users'
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end
  end

  describe '#show' do
    before(:each) do
      get "/users/#{@user.id}"
    end

    it 'retrieves one user' do
      expect(response.status).to eq 200
    end

    it 'responds with valid JSON' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns the correct user information' do
      user_response = json(response.body)
      expect(user_response[:username]).to eq 'foo'
    end
  end

  describe '#create' do
    
    before(:each) do
      post '/users',
      { user:
        { first_name: 'far', last_name: 'boo', username: 'farboo', role: 'generic', email: 'foz@baz.com', password: 'secret'}
      }.to_json, {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end
    
    it 'creates a new user' do
      expect(response.status).to eq 201
    end
    
    it 'returns the location of the user' do
      user = json(response.body)
      expect(user_url(user[:id])).to eq response.location
    end

    # TODO: fix unpermitted params bug
    # I can pass in unpermitted params if I give the password param a value
    it 'refuses without the proper parameters' do
      post '/users',
      { user:
        { username: 12, email: '', password: '', name: 'jason', about: 'about me'}
      }.to_json, {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response.status).to eq 422
    end
  end

  describe '#update' do
    it 'updates only the new params' do
      
    end
  end

  describe '#destroy' do
  end


end

























