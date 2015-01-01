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
  end
end

=begin
https://dev.twitter.com/oauth/overview/creating-signatures

=end
