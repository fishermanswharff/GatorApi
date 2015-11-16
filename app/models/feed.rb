require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base

  validate :valid_feed?
  validates :url, format: { with: /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#\/\/\=]*)/, message: 'Must be a valid url.' }

  before_save :add_title_value, :add_description_value, :add_image_url_value,
    :add_feed_type, :add_feed_version, :add_encoding

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

  def add_title_value
    self.title = @feed.channel.title
  end

  def add_description_value
    self.description = @feed.channel.description
  end

  def add_image_url_value
    self.image_url = @feed.channel.image.url
  end

  def add_feed_type
    self.feed_type = @feed.feed_type
  end

  def add_feed_version
    self.feed_version = @feed.feed_version
  end

  def add_encoding
    self.encoding = @feed.encoding
  end

  def feed
    @feed ||= RSS::Parser.parse(url)
  end

end
