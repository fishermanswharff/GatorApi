module OAuth

  require 'net/http'
  
  class RequestToken
    
    attr_accessor :provider, :nonce, :timestamp, :callback

    def initialize(provider)
      @provider = provider
      # @nonce = SecureRandom.uuid.gsub(/[\-\n\r]/,'')
      @timestamp = Time.now.utc.strftime('%s').to_i.to_s
      @callback = "http://127.0.0.1/users/auth/twitter/callback"
    end

    def get_method
      "POST"
    end

    def get_nonce
      CGI::escape(Base64.encode64(OpenSSL::Random.random_bytes(64)).gsub(/\W/, ''))
    end

    def get_base_url
      @base_url = "https://api.twitter.com/oauth/request_token"
    end

    def collect_parameters
      count = 0
      basestring = ""
      hash = {
        oauth_callback: "#{@callback}",
        oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
        oauth_nonce: "#{get_nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{@timestamp}",
        oauth_version: "1.0"
      }
      hash.each { |key,value| 
        count += 1
        if count == hash.length
          basestring << CGI::escape(key.to_s) + "=" + CGI::escape(value).to_s
        else
          basestring << CGI::escape(key.to_s) + "=" + CGI::escape(value).to_s + "%26"
        end
      }
      basestring
    end

    def get_signature_base_string
      get_method + "&" + CGI::escape(get_base_url) + "&" + CGI::escape(collect_parameters)
    end

    def get_signing_key
      CGI::escape(ENV['TWITTER_CONSUMER_SECRET'] + "%26" + ENV['TWITTER_ACCESS_TOKEN'])
    end

    def calculate_signature
      CGI::escape(Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'),get_signing_key, get_signature_base_string)).gsub(/\n| |\r/,''))
    end

    def get_header_string
      header = "OAuth"

      # string = 'OAuth oauth_callback="' + "#{CGI::escape(@callback)}" + '", oauth_consumer_key="'+"#{CGI::escape(ENV['TWITTER_CONSUMER_KEY'])}" + '", oauth_nonce="'+ "#{CGI::escape(get_nonce)}" + '", oauth_signature="' + "#{CGI::escape(calculate_signature)}" + '", oauth_signature_method="HMAC-SHA1", oauth_timestamp="' + "#{@timestamp}" + '", oauth_version="1.0"'
      # puts string
    end
    
    def request_data(header, base_uri, method, post_data=nil)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host, 443) # set to 80 if not using HTTPS
      http.use_ssl = true # ignore if not using HTTPS
      if method == 'POST'
        # post_data here should be your encoded POST string, NOT an array
        resp, data = http.post(url.path, post_data, { 'Authorization' => header })
      else
        resp, data = http.get(url.to_s, { 'Authorization' => header })
      end
      resp
    end

    # response = request_data(get_header_string, get_base_url, get_method)

  end
end



=begin
https://dev.twitter.com/oauth/overview/creating-signatures
Every oauth_* parameter needs to be included in the signature

POST
https://api.twitter.com/oauth/request_token
oauth_callback=http://127.0.0.1/users/auth/twitter/callback
oauth_consumer_key=ENV['TWITTER_CONSUMER_KEY']
oauth_nonce=SecureRandom.uuid.gsub(/[\-\n\r]/,'')
oauth_signature_method=HMAC-SHA1
oauth_timestamp=Time.now.utc.strftime('%s').to_i
oauth_token=ENV['TWITTER_ACCESS_TOKEN']
oauth_version=1.0

to create the signature,

=end

# "POST&https%3A%2F%2Fapi.twitter.com%2Foauth%2Frequest_token&oauth_callback=http%3A%2F%2F127.0.0.1%2Fusers%2Fauth%2Ftwitter%2Fcallbackoauth_consumer_key=Ja2vRzXC1C0KDw7uaNFbbWoZsoauth_nonce=cd2cb72df8414e5184be15f6046c5316oauth_signature_method=HMAC-SHA1oauth_timestamp=1420154407oauth_token=20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6oauth_version=1.0"


