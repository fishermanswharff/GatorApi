require 'rails_helper'
require 'spec_helper'

describe 'User API Endpoint' do

  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  describe '#login' do

    context 'for admins' do
      before :each do
        post '/login', { username: "#{admin.username}", password: 'password' }
      end

      it 'has valid authentication with token' do
        expect(response.status).to eq 202
      end

      it 'responds with valid JSON' do
        expect(response.content_type).to eq Mime::JSON
      end


      it 'expects a token in the response' do
        user = json(response.body)
        expect(user[:token]).to_not be_nil
      end

      it 'updates the user signin count' do
        user = json(response.body)
        expect(user[:sign_in_count]).to eq 1
      end

      it 'refuses invalid authentication' do
        post '/login',{ email: 'foo@bar.com', password: 'bar' }
        expect(response.status).to eq 401
      end
    end

    context 'for regular users' do
      before :each do
        post '/login', { username: "#{user.username}", password: 'password' }
      end

      it 'has valid authentication with token' do
        expect(response.status).to eq 202
      end

      it 'responds with valid JSON' do
        expect(response.content_type).to eq Mime::JSON
      end

      it 'refuses invalid authentication' do
        post '/login',{ email: 'foo@bar.com', password: 'bar' }
        expect(response.status).to eq 401
      end

      it 'expects a token in the response' do
        user = json(response.body)
        expect(user[:token]).to_not be_nil
      end

      it 'updates the user signin count' do
        user = json(response.body)
        expect(user[:sign_in_count]).to eq 1
      end
    end

  end

  describe '#logout' do
    before :each do
      get '/logout', {}, { 'HTTP_AUTHORIZATION' => "Token token=#{admin.token}" }
    end

    it 'is successful' do
      expect(response.status).to eq 200
    end

    it 'logs the user out' do
      expect(response.body).to eq ""
    end
  end

  describe '#index' do
    before :each do
      get '/users', {}, { 'HTTP_AUTHORIZATION' => "Token token=#{admin.token}" }
    end

    it 'retrieves all of the users' do
      expect(response).to be_success
    end

    it 'returns valid json' do
      users = json(response.body)
      expect(users.length).to eq(2)
    end
  end

  describe '#show' do
    before :each do
      get "/users/#{user.id}"
    end

    it 'retrieves one user' do
      expect(response.status).to eq 200
    end

    it 'responds with valid JSON' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns the correct user information' do
      user_response = json(response.body)
      expect(user_response[:username]).to eq "#{user.username}"
    end
  end

  describe '#create' do

    before(:each) do
      post '/users',
      { user:
        { first_name: 'far', last_name: 'boo', username: 'farboo', role: 'generic', email: 'foz@baz.com', password: 'secret', password_confirmation: 'secret' }
      }.to_json, {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end

    it 'creates a new user' do
      expect(response.status).to eq 201
    end

    it 'returns the location of the user' do
      user = json(response.body)
      expect(user_url(user[:id])).to eq response.location
    end

    it 'refuses without the proper parameters' do
      post '/users',
      { user:
        { username: 12, email: '', password: '', name: 'jason', about: 'about me'}
      }.to_json, {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response.status).to eq 422
    end
  end

  describe '#update' do
    before(:each) do
      patch "/users/#{user.id}",
      { user:
        { first_name: 'jason', last_name: 'wharff', role: 'admin', password: 'secret' }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      @user_response = json(response.body)
    end

    it 'responds with success' do
      expect(response.status).to eq 200
    end

    it 'updates only the new params' do
      expect(@user_response[:first_name]).to eq 'jason'
    end

    it 'doesn''t update any other params' do
      expect(@user_response[:username]).to eq "#{user.username}"
    end
  end

  describe '#destroy' do
    it 'deletes existing user' do
      delete "/users/#{user.id}"
      expect(response.status).to eq 204
    end
  end
end

























