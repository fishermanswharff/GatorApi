class TweetsController < ApplicationController

  before_filter :authenticate

  def index
    user = authenticate
    twitter = Twatter.new(user)
    tweets = twitter.get_tweets
    render json: tweets.to_json
  end
end
