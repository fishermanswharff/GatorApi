require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'
require File.join(Rails.root, "lib/modules/OAuth.rb")

describe OAuth do

  describe OAuth::RequestToken do

    before(:all) do
      User.delete_all
      @user = User.create({ first_name:"Foo",last_name:"Bar",email:"far@boo.com",username:"foo",role:"generic",token:"8e961240e4164e008d60bcddc85b2462", password_digest: "$2a$10$q6mH6Ho2NpQMhuFIOIqqBOWzYMS4d69PLuYHdUzXgiemj/L8zZpfa"})
      @request = OAuth::RequestToken.new('twitter', @user.token)
    end

    describe '#initialize' do
      it 'returns the provider passed as the parameter' do
        expect(@request.provider).to eq 'twitter'
      end
      it 'sets the values needed' do
        expect(@request.consumer_key).to eq ENV['TWITTER_CONSUMER_KEY']
        expect(@request.consumer_secret).to eq ENV['TWITTER_CONSUMER_SECRET']
        expect(@request.callback).to eq "http://localhost:3000/users/auth/twitter/callback?user-token=8e961240e4164e008d60bcddc85b2462&provider=twitter"
      end
    end

    describe '#url_encode' do
      it 'percent encodes the string' do
        expect(@request.url_encode(@request.callback)).to eq "http%3A%2F%2Flocalhost%3A3000%2Fusers%2Fauth%2Ftwitter%2Fcallback%3Fuser-token%3D8e961240e4164e008d60bcddc85b2462%26provider%3Dtwitter"
      end
    end

    describe '#get_method' do
      it 'returns the http request method' do
        expect(@request.get_method).to eq 'POST'
      end
    end

    describe '#get_base_url' do
      it 'returns the base url to send the request' do
        expect(@request.get_base_url).to eq 'https://api.twitter.com/oauth/request_token'
      end
    end

    describe '#params' do
      it 'returns a hash of params' do
        expect(@request.params.class).to eq Hash
        expect(@request.params[:oauth_callback]).to eq "http://localhost:3000/users/auth/twitter/callback?user-token=8e961240e4164e008d60bcddc85b2462&provider=twitter"
        expect(@request.params[:oauth_consumer_key]).to eq ENV['TWITTER_CONSUMER_KEY']
        expect(@request.params[:oauth_timestamp]).to eq @request.timestamp
      end
    end

    describe '#add_signature_to_params' do
      it 'appends a key/value pair to the params hash' do
        # expect(@request.add_signature_to_params(signature)).to eq {}
      end
    end

    describe '#collect_parameters' do
      it 'returns the base string of all the parameters' do
        expect(@request.collect_parameters.class).to be String
      end
    end

    describe '#get_signature_base_string' do
      it 'should percent encode the base string' do
      end
    end

    describe '#get_signing_key' do
      it 'should return secrets' do
      end
    end

    describe '#calculate_signature' do
      it 'should encrypt the signature base string with the signing key' do
        # expect(@request.calculate_signature).to eq
      end
    end

    describe '#get_header_string' do
      it 'should return a string for a curl header' do
      end
    end

    describe '#request_data' do
      it 'should send a request' do
        @token_req = OAuth::RequestToken.new('twitter', @user.token)
        response = @token_req.request_data(@request.get_header_string,@request.get_base_url,@request.get_method)
        expect(response.code).to eq '200'
        expect(response.class).to eq Net::HTTPOK
        body = response.body.split('&').each_with_object({}) { |i,o| o[i.split('=')[0]] = i.split('=')[1] }
        expect(body['oauth_token'].class).to eq String
        expect(body['oauth_token_secret'].class).to eq String
        expect(body['oauth_callback_confirmed']).to eq 'true'
        p response,response.body
      end
    end
  end
end








