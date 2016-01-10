require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base

  validate :valid_feed?
  validates :url, format: { with: /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#\/\/\=]*)/, message: 'Must be a valid url.' }

  has_many :userfeeds
  has_many :users, through: :userfeeds

  protected

  def valid_feed?
    begin
      feed.valid?
    rescue => e
      errors.add(:url, e.message)
    end
  end

  def feed
    RSS::Parser.parse(url)
  end

end
