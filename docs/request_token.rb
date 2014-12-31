
curl 
--get 
'https://api.twitter.com/1.1/statuses/home_timeline.json' 
--header 
'Authorization: OAuth 
  oauth_consumer_key="Ja2vRzXC1C0KDw7uaNFbbWoZs", 
  oauth_nonce="15dbb2e95b203a15d4af08b99b1d319a", 
  oauth_signature="8Zqkl9zX5uJmuCl%2B%2B2byqyg%2BE5M%3D", 
  oauth_signature_method="HMAC-SHA1", 
  oauth_timestamp="1419862632", 
  oauth_token="20350433-eOEz083pFqaMYyKsNsZQR57cwtVTkfOlx4cLtQbw6", 
  oauth_version="1.0"' 
--verbose

# new comment

=begin

To obtain a Request Token, the Consumer sends an HTTP request to the 
Service Provider’s Request Token URL. The Service Provider documentation 
specifies the HTTP method for this request, and HTTP POST is RECOMMENDED. 
The request MUST be signed and contains the following parameters: 

auth_consumer_key:
    The Consumer Key. 
oauth_signature_method:
    The signature method the Consumer used to sign the request. 
oauth_signature:
    The signature as defined in Signing Requests. 
    the oauth signature is a base64 hmac sha1 encoding of the Consumer Secret and Token Secret 
oauth_timestamp:
    As defined in Nonce and Timestamp. 
oauth_nonce:
    As defined in Nonce and Timestamp. 
oauth_version:
    OPTIONAL. If present, value MUST be 1.0 . Service Providers MUST assume the protocol version to be 1.0 if this parameter is not present. Service Providers’ response to non-1.0 value is left undefined. 
Additional parameters:
    Any additional parameters, as defined by the Service Provider. 
=end



