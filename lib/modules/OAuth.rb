module OAuth

  require 'net/http'
  
  class RequestToken
    
    attr_accessor :provider, :consumer_key, :consumer_secret, :base_url, :timestamp, :callback, :params

    def initialize(provider)
      @provider = provider
      @consumer_key = ENV['TWITTER_CONSUMER_KEY']
      @consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      @timestamp = Time.now.utc.to_i.to_s
      @callback = 'http://localhost:3000/users/auth/twitter/callback'
      @params = {
        oauth_callback: "#{@callback}",
        oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
        oauth_nonce: "#{get_nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{@timestamp}",
        oauth_version: "1.0"
      }
    end

    def url_encode(value)
      CGI::escape(value)
    end

    def get_method
      "POST"
    end

    def get_nonce
      SecureRandom.uuid.gsub(/\-|\n|\r/,'')
    end

    def get_base_url
      @base_url = "https://api.twitter.com/oauth/request_token"
    end

    def add_signature_to_params(value)
      @params[:oauth_signature] = value
    end

    def collect_parameters
      @params.sort.collect{ |k, v| "#{url_encode(k.to_s)}=#{url_encode(v)}" }.join('&')
    end

    def get_signature_base_string
      get_method + "&" + url_encode(get_base_url) + "&" + url_encode(collect_parameters)
    end

    def get_signing_key
      url_encode(ENV['TWITTER_CONSUMER_SECRET']) + "&"
    end

    def calculate_signature
      Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), get_signing_key, get_signature_base_string)).gsub(/\n| |\r/,'')
    end

    def get_header_string
      add_signature_to_params(calculate_signature)
      header = "OAuth "
      @params.sort.each do |k,v|
        header << "#{k}=\"#{url_encode(v)}\", "
      end
      header.slice(0..-3)
    end
    
    def request_data(header, base_uri, method, post_data=nil)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host, 443) # set to 80 if not using HTTPS
      http.use_ssl = true # ignore if not using HTTPS
      if method == 'POST'
        # post_data here should be your encoded POST string, NOT an array
        resp, data = http.post(base_uri, post_data, { 'Content-Type'=> '', 'Authorization' => header })
      else
        resp, data = http.get(url.to_s, { 'Authorization' => header })
      end
      resp
    end
  end

  class Authentication 
    def self.get_authentication(base_uri, params)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host,443)
      http.use_ssl = true
      resp = http.get(base_uri+"?"+params)
    end
  end
end