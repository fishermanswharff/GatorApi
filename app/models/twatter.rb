class Twatter

  attr_accessor :client

  def initialize(user)
    auth = get_auth(user)
    token = auth.params['oauth_token']
    secret = auth.params['oauth_token_secret']
    screen_name = auth.params["screen_name"]
    @client = get_client(token,secret)
  end

  def get_tweets
    Rails.cache.fetch([:user_tweets, self], expires_in: 15.minutes) do
      self.client.home_timeline
    end
  end

  def get_auth(user)
    user.user_authentications.map { |i| i if i.authentication_provider.name == 'twitter' }.first
  end

  def get_client(token,secret)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
