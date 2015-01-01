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
  end
end