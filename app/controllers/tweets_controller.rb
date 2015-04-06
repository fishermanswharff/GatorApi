class TweetsController < ApplicationController

  before_filter :authenticate

  def index
    user = authenticate
    twitter = Twatter.new(user)
    Rails.cache.fetch([:user_tweets,self], expires_in: 5.minutes) do
      tweets = twitter.client.home_timeline
      render json: tweets.to_json
    end
  end
end