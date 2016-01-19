module RssParser
  require 'nokogiri'
  require 'open-uri'

  def self.get_rss_links(url)
    page = Nokogiri::HTML(open(url))
    uri = URI(url)
    links = page.css('a').map do |anchor|
      match = anchor.to_s.match(/href[\s]?[=][\s]?['|"][\s]?[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\?\+.~#\/\/\=]*)"/)
      if match.present?
        link = {}
        link[:url] = anchor.attributes['href'].value
        link[:text] = anchor.children.text
        unless link[:url].start_with?('http')
          link[:url] = link[:url].prepend "#{uri.scheme}://#{uri.host}"
        end
        link
      end
    end.compact
  end
end
