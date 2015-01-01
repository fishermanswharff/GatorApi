module OAuth
  
  class RequestToken
    
    attr_accessor :provider

    def initialize(provider)
      @provider = provider
    end

    def consumer_key
    end

    def signature_method
      "HMAC-SHA1"
    end

    def signature
    end

    def timestamp
      Time.now.utc.strftime('%s').to_i
    end

    def nonce
      SecureRandom.uuid.gsub(/[\-\n\r]/,'')
    end

    def oauth_token
      ENV['TWITTER_ACCESS_TOKEN']
    end

    def version
      "1.0"
    end

    def escape(value)
      CGI::escape(value)
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

