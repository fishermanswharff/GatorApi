class Twatter

  attr_accessor :current_user, :auth, :client

  def initialize(user)
    @current_user = user
    @auth = @current_user.user_authentications.map { |i| i if i.authentication_provider.name == 'twitter' }.first
    token = @auth.params["oauth_token"]
    secret = @auth.params["oauth_token_secret"]
    screen_name = @auth.params["screen_name"]
  end

  def self.twitter(token,secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end