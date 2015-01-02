require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'
require File.join(Rails.root, "lib/modules/OAuth.rb")

describe 'OAuth' do

  describe 'OAuth::RequestToken' do

    before(:all) do
      @request = OAuth::RequestToken.new('twitter')
    end
    
    describe '#initialize' do
      it 'returns the provider passed as the parameter' do
        expect(@request.provider).to eq 'twitter'
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

      end
    end

    describe '#calculate_headers' do
      it 'should return a string for posting as a header' do
      end
    end
  end
end