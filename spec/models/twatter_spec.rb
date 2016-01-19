require 'rails_helper'

RSpec.describe Twatter, type: :model do

  before(:each) do
    @jenna = User.create({ first_name: 'jenna', last_name: 'wharff', username: 'jennawharff', role: 'generic', email: 'jennawharff@me.com', password: 'secret', password_confirmation: 'secret' })
    @jason = User.create({ first_name: 'jason', last_name: 'wharff', username: 'jasonwharff', role: 'admin', email: 'fishermanswharff@mac.com', password: 'secret', password_confirmation: 'secret' })
    AuthenticationProvider.create(name: 'twitter')
    @jenna_auth = UserAuthentication.create_from_omniauth({"oauth_token"=> ENV['TWITTER_JENNA_TOKEN'], "oauth_token_secret"=> ENV['TWITTER_JENNA_SECRET'], "user_id"=>"#{@jenna.id}", "screen_name"=>"ndpndntjn"}, @jenna, 'twitter')
    @jason_auth = UserAuthentication.create_from_omniauth({"oauth_token"=> ENV['TWITTER_ACCESS_TOKEN'], "oauth_token_secret"=> ENV['TWITTER_ACCESS_SECRET'], "user_id"=>"#{@jason.id}", "screen_name"=>"jasonwharff"}, @jason, 'twitter')
  end

  let(:jenna_twitter) { Twatter.new(@jenna) }
  let(:jason_twitter) { Twatter.new(@jason) }

  describe '#initialize' do
    it 'is of the Twatter class' do
      expect(jenna_twitter.class).to be Twatter
      expect(jason_twitter.class).to be Twatter
    end

    it 'finds the authentications associated with that user' do
      expect(jenna_twitter.get_auth(@jenna)).to eq @jenna_auth
      expect(jason_twitter.get_auth(@jason)).to eq @jason_auth
    end

    it 'creates a new client based on the user''s authentications' do
      expect(jason_twitter.get_client(ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_SECRET']).class).to eq Twitter::REST::Client
      expect(jenna_twitter.get_client(ENV['TWITTER_JENNA_TOKEN'], ENV['TWITTER_JENNA_SECRET']).class).to eq Twitter::REST::Client
    end
  end

  # TODO: stub out response to we're not pinging twitter
  describe '#get_tweets' do
    it 'gets the home timeline for the user' do
      expect(jason_twitter.get_tweets).to_not be nil
      expect(jason_twitter.get_tweets.class).to be Array
      expect(jason_twitter.get_tweets[0].class).to eq Twitter::Tweet
    end
  end

end
