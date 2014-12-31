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

    def version
      "1.0"
    end
  end
end