require 'rails_helper'

RSpec.describe Twatter, type: :model do

  before(:all) do
    User.destroy_all
    AuthenticationProvider.destroy_all
    UserAuthentication.destroy_all

    @jenna = User.create({ first_name: 'jenna', last_name: 'wharff', username: 'jennawharff', role: 'generic', email: 'jennawharff@me.com', password: 'secret' })
    @jason = User.create({ first_name: 'jason', last_name: 'wharff', username: 'jasonwharff', role: 'admin', email: 'fishermanswharff@mac.com', password: 'secret' })
    AuthenticationProvider.create(name: 'twitter')
    @jenna_auth = UserAuthentication.create_from_omniauth({"oauth_token"=> ENV['TWITTER_JENNA_TOKEN'], "oauth_token_secret"=> ENV['TWITTER_JENNA_SECRET'], "user_id"=>"979312783", "screen_name"=>"ndpndntjn"}, @jenna, 'twitter')
    @jason_auth = UserAuthentication.create_from_omniauth({"oauth_token"=> ENV['TWITTER_ACCESS_TOKEN'], "oauth_token_secret"=> ENV['TWITTER_ACCESS_SECRET'], "user_id"=>"20350433", "screen_name"=>"jasonwharff"}, @jason, 'twitter')
  end
  let(:jenna_twitter) { Twatter.new(@jenna) }
  let(:jason_twitter) { Twatter.new(@jason) }

  describe '#initialize' do
    it 'is of the Twatter class' do
      expect(jenna_twitter.class).to be Twatter
      expect(jason_twitter.class).to be Twatter
    end
    it 'finds the user based on the parameters' do
      expect(jenna_twitter.current_user).to be @jenna
      expect(jason_twitter.current_user).to be @jason
    end
    it 'finds the authentications associated with that user' do
      expect(jenna_twitter.auth).to eq @jenna_auth
      expect(jason_twitter.auth).to eq @jason_auth
    end

    it 'creates a new client based on the user''s authentications' do
      expect(jason_twitter.client.class).to eq Twitter::REST::Client
      expect(jenna_twitter.client.class).to eq Twitter::REST::Client
    end
  end
end