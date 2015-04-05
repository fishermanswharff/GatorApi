module OAuth
  require 'net/http'

  class RequestToken
    attr_accessor :provider, :timestamp, :callback, :params

    def initialize(provider,user_token)
      @provider = provider
      @timestamp = Time.now.utc.to_i.to_s
      @callback = 'http://localhost:3000/users/auth/twitter/callback?user-token=' + "#{user_token}&provider=#{@provider}"
      @params = {
        oauth_callback: "#{@callback}",
        oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
        oauth_nonce: "#{OAuth::get_nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{@timestamp}",
        oauth_version: "1.0"
      }
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

  class AccessToken
    attr_accessor :data, :params

    def initialize(provider,data)
      @provider = provider
      @consumer_key = ENV['TWITTER_CONSUMER_KEY']
      @consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      @timestamp = Time.now.utc.to_i.to_s
      @data = data
      @params = {
        oauth_consumer_key: "#{ENV['TWITTER_CONSUMER_KEY']}",
        oauth_nonce: "#{OAuth::get_nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{@timestamp}",
        oauth_version: "1.0"
      }
    end

    def request_data(header, base_uri, method, post_data=nil)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host, 443) # set to 80 if not using HTTPS
      http.use_ssl = true # ignore if not using HTTPS
      if method == 'POST'
        # post_data here should be your encoded POST string, NOT an array
        resp, data = http.post(base_uri, post_data[:params], { 'Content-Type'=> '', 'Authorization' => header })
      else
        resp, data = http.get(url.to_s, { 'Authorization' => header })
      end
      resp
    end
  end

  def self.get_base_url(param)
    "https://api.twitter.com/oauth/#{param}"
  end

  def self.url_encode(value)
    CGI::escape(value)
  end

  def self.get_nonce
    SecureRandom.uuid.gsub(/\-|\n|\r/,'')
  end

  def self.get_method
    'POST'
  end

  def self.collect_parameters(hash)
    hash.sort.collect{ |k, v| "#{OAuth::url_encode(k.to_s)}=#{OAuth::url_encode(v)}" }.join('&')
  end

  def self.get_signature_base_string(param_url, param_hash)
    OAuth::get_method + "&" + OAuth::url_encode(OAuth::get_base_url(param_url)) + "&" + OAuth::url_encode(OAuth::collect_parameters(param_hash))
  end

  def self.get_signing_key
    OAuth::url_encode(ENV['TWITTER_CONSUMER_SECRET']) + "&"
  end

  def self.calculate_signature(param_url, param_hash)
    Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), OAuth::get_signing_key, OAuth::get_signature_base_string(param_url,param_hash))).gsub(/\n| |\r/,'')
  end

  def self.add_signature_to_params(hash,value)
    hash[:oauth_signature] = value
    hash
  end

  def self.get_header_string(param_url, param_hash)
    hash = OAuth::add_signature_to_params(param_hash,OAuth::calculate_signature(param_url,param_hash))
    header = "OAuth "
    hash.sort.each do |k,v|
      header << "#{k}=\"#{OAuth::url_encode(v)}\", "
    end
    header.slice(0..-3)
  end
end







































