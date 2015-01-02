module OAuth
  
  class RequestToken
    
    attr_accessor :provider, :nonce, :timestamp, :callback

    def initialize(provider)
      @provider = provider
      @nonce = SecureRandom.uuid.gsub(/[\-\n\r]/,'')
      @timestamp = Time.now.utc.strftime('%s').to_i
      @callback = "http://127.0.0.1/users/auth/twitter/callback"
    end

    def get_method
      "POST"
    end

    def get_base_url
      @base_url = "https://api.twitter.com/oauth/request_token"
    end

    def collect_parameters
      count = 0
      basestring = ""
      hash = {
        oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
        oauth_nonce: "#{@nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{@timestamp}",
        oauth_version: "1.0"
      }
      hash.each { |key,value| 
        count += 1
        if count == hash.length
          basestring << CGI::escape(key.to_s) + "=" + CGI::escape(value).to_s
        else
          basestring << CGI::escape(key.to_s) + "=" + CGI::escape(value).to_s + "&" 
        end
      }
      basestring
    end

    def get_signature_base_string
      get_method + "&" + CGI::escape(get_base_url) + "&" + CGI::escape(collect_parameters)
    end

    def get_signing_key
      CGI::escape(ENV['TWITTER_CONSUMER_SECRET']) + "&" + CGI::escape(ENV['TWITTER_ACCESS_SECRET'])
    end

    def calculate_signature
      CGI::escape(Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'),get_signature_base_string, get_signing_key)).gsub(/\n| |\r/,''))
    end

    def calculate_headers
      string = 'Authorization: OAuth oauth_consumer_key="'+"#{CGI::escape(ENV['TWITTER_CONSUMER_KEY'])}" + '", oauth_nonce="'+ "#{CGI::escape(@nonce)}" + '", oauth_signature="' + "#{calculate_signature}" + '", oauth_signature_method="HMAC-SHA1", oauth_timestamp="' + "#{@timestamp}" + '", oauth_version="1.0"'
      puts string
    end

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


