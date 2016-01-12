require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'
require File.join(Rails.root, "lib/modules/OAuth.rb")

describe OAuth do

  let(:provider) { 'twitter' }
  let(:callback) { "http://localhost:3333#{ENV['TWITTER_CALLBACK_URL']}?user-token=8e961240e4164e008d60bcddc85b2462&provider=#{provider}" }
  let(:timestamp) { Time.now.utc.to_i.to_s }
  let(:nonce) { '123fbf6cc3464a488eaee4e105253f75' }
  let(:request_params) {
    {
      oauth_callback: "#{callback}",
      oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
      oauth_nonce: "#{nonce}",
      oauth_signature_method: "HMAC-SHA1",
      oauth_timestamp: "#{timestamp}",
      oauth_version: "1.0"
    }
  }
  let(:access_params) {
    {
      oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
      oauth_nonce: "#{nonce}",
      oauth_signature_method: "HMAC-SHA1",
      oauth_timestamp: "#{timestamp}",
      oauth_version: "1.0"
    }
  }

  let(:request_token_signature) { OAuth.calculate_signature('request_token',request_params) }
  let(:access_token_signature) { OAuth.calculate_signature('access_token',access_params) }

  describe 'OAuth.get_base_url' do
    it 'returns the base url for requesting a twitter request_token or access_token' do
      expect(OAuth.get_base_url('request_token')).to eq "#{ENV['TWITTER_API_OAUTH_URL']}/request_token"
      expect(OAuth.get_base_url('access_token')).to eq "#{ENV['TWITTER_API_OAUTH_URL']}/access_token"
    end
  end

  describe 'OAuth.url_encode' do
    it 'percent encodes the string' do
      expect(OAuth.url_encode("http://localhost:3333#{ENV['TWITTER_CALLBACK_URL']}?user-token=8e961240e4164e008d60bcddc85b2462&provider=twitter")).to eq "http%3A%2F%2Flocalhost%3A3333%2Fusers%2Fauth%2Ftwitter%2Fcallback%3Fuser-token%3D8e961240e4164e008d60bcddc85b2462%26provider%3Dtwitter"
    end
  end

  describe 'OAuth.get_method' do
    it 'returns POST as the method' do
      expect(OAuth.get_method).to eq 'POST'
    end
  end

  describe 'OAuth.collect_parameters' do
    it 'returns the base string of all the parameters' do
      expect(OAuth.collect_parameters(request_params).class).to be String
      expect(OAuth.collect_parameters(request_params)).to eq "oauth_callback=http%3A%2F%2Flocalhost%3A3333%2Fusers%2Fauth%2Ftwitter%2Fcallback%3Fuser-token%3D8e961240e4164e008d60bcddc85b2462%26provider%3Dtwitter&oauth_consumer_key=#{ENV['TWITTER_CONSUMER_KEY']}&oauth_nonce=123fbf6cc3464a488eaee4e105253f75&oauth_signature_method=HMAC-SHA1&oauth_timestamp=#{timestamp}&oauth_version=1.0"
    end
  end

  describe 'OAuth.get_signature_base_string' do
    it 'should percent encode the base string and the params hash' do
      expect(OAuth.get_signature_base_string('request_token',request_params)).to eq "POST&https%3A%2F%2Fapi.twitter.com%2Foauth%2Frequest_token&oauth_callback%3Dhttp%253A%252F%252Flocalhost%253A3333%252Fusers%252Fauth%252Ftwitter%252Fcallback%253Fuser-token%253D8e961240e4164e008d60bcddc85b2462%2526provider%253Dtwitter%26oauth_consumer_key%3D#{ENV['TWITTER_CONSUMER_KEY']}%26oauth_nonce%3D123fbf6cc3464a488eaee4e105253f75%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D#{timestamp}%26oauth_version%3D1.0"
      expect(OAuth.get_signature_base_string('access_token',access_params)).to eq "POST&https%3A%2F%2Fapi.twitter.com%2Foauth%2Faccess_token&oauth_consumer_key%3D#{ENV['TWITTER_CONSUMER_KEY']}%26oauth_nonce%3D123fbf6cc3464a488eaee4e105253f75%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D#{timestamp}%26oauth_version%3D1.0"
    end
  end

  describe 'OAuth.get_signing_key' do
    it 'returns the twitter consumer key plus and ampersand as a string' do
      expect(OAuth.get_signing_key).to eq ENV['TWITTER_CONSUMER_SECRET'] + '&'
    end
  end

  describe 'OAuth.calculate_signature' do
    it 'returns Base64 encoded signature' do
      expect(OAuth.calculate_signature('request_token',request_params)).to eq Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), OAuth.get_signing_key, OAuth.get_signature_base_string('request_token',request_params))).gsub(/\n|\s|\r/,'')
    end
  end

  describe 'OAuth.add_signature_to_params' do
    it 'appends a key/value pair to the params hash' do
      OAuth.add_signature_to_params(request_params,OAuth.calculate_signature('request_token',request_params))
      expect(request_params[:oauth_signature]).not_to be nil
      expect(request_params.length).to eq 7
    end
  end

  describe 'OAuth.get_header_string' do
    it 'converts a hash to a string' do
      signature = CGI::escape(OAuth.calculate_signature('request_token', request_params))
      expect(OAuth.get_header_string('request_token',request_params)).to eq "OAuth oauth_callback=\"http%3A%2F%2Flocalhost%3A3333%2Fusers%2Fauth%2Ftwitter%2Fcallback%3Fuser-token%3D8e961240e4164e008d60bcddc85b2462%26provider%3Dtwitter\", oauth_consumer_key=\"#{ENV['TWITTER_CONSUMER_KEY']}\", oauth_nonce=\"123fbf6cc3464a488eaee4e105253f75\", oauth_signature=\"#{signature}\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"#{timestamp}\", oauth_version=\"1.0\""
    end
  end

  describe OAuth::RequestToken do

    before(:all) do
      User.destroy_all
      @user = User.create({ first_name:"Foo",last_name:"Bar",email:"far@boo.com",username:"foo",role:"generic",token:"8e961240e4164e008d60bcddc85b2462", password_digest: "$2a$10$q6mH6Ho2NpQMhuFIOIqqBOWzYMS4d69PLuYHdUzXgiemj/L8zZpfa"})
      @request = OAuth::RequestToken.new('twitter', @user.token)
    end

    describe '#initialize' do
      it 'sets the provider passed as the parameter' do
        expect(@request.provider).to eq 'twitter'
      end
      it 'sets the callback url with the provider and token passed in' do
        expect(@request.callback).to eq "http://localhost:3333#{ENV['TWITTER_CALLBACK_URL']}?user-token=8e961240e4164e008d60bcddc85b2462&provider=twitter"
      end
    end

    describe 'params' do
      it 'is a hash of oauth params' do
        expect(@request.params.class).to eq Hash
      end
      it 'has a callback key/value pair with the user token and provider name' do
        expect(@request.params[:oauth_callback]).to eq "http://localhost:3333#{ENV['TWITTER_CALLBACK_URL']}?user-token=8e961240e4164e008d60bcddc85b2462&provider=twitter"
      end
      it 'has the twitter consumer key as a value' do
        expect(@request.params[:oauth_consumer_key]).to eq ENV['TWITTER_CONSUMER_KEY']
      end
      it 'has the class instance variable timestamp' do
        expect(@request.params[:oauth_timestamp]).to eq @request.timestamp
      end
    end

    # TODO: stub out this request/response
    describe '#request_data' do
      it 'should send a request' do
        @token_req = OAuth::RequestToken.new('twitter', @user.token)
        response = @token_req.request_data(OAuth.get_header_string('request_token', @token_req.params),OAuth.get_base_url('request_token'),OAuth.get_method)
        expect(response.code).to eq '200'
        expect(response.class).to eq Net::HTTPOK
        body = response.body.split('&').each_with_object({}) { |i,o| o[i.split('=')[0]] = i.split('=')[1] }
        expect(body['oauth_token'].class).to eq String
        expect(body['oauth_token_secret'].class).to eq String
        expect(body['oauth_callback_confirmed']).to eq 'true'
      end
    end
  end

  describe OAuth::AccessToken do

    before(:all) do
      User.destroy_all
      @user = User.create({ first_name:"Foo",last_name:"Bar",email:"far@boo.com",username:"foo",role:"generic",token:"8e961240e4164e008d60bcddc85b2462", password_digest: "$2a$10$q6mH6Ho2NpQMhuFIOIqqBOWzYMS4d69PLuYHdUzXgiemj/L8zZpfa"})
      @request = OAuth::AccessToken.new('twitter', "oauth_token=vXRrcMnxtT52Pf0suKaHsW67I8V0tV03&oauth_verifier=cBaabHkbVCwMlpUbrIYJ1XT7sHPUxXSi")
    end

    describe '#initialize' do
      it 'sets the provider passed as the parameter' do
        # write expectations
      end
    end

  end
end

