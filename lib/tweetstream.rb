require 'tweetstream'
require 'http'

TweetStream.configure do |config|
  config.consumer_key       = '46tffXckn8yxB4hkZ1Acsz4G1'
  config.consumer_secret    = 'Yb59BrD4KaPPTin1SBShtGn6ECEnDMfH9hzvlKmYQu4cylPEzX'
  config.oauth_token        = '450829735-Dvx4WZMykC9WdMQqHh7MV55DVZBLKqorH9N6nMGP'
  config.oauth_token_secret = 'hBMpKheeDLeUE6oaWGE3J9tj6uAelYyxxMVEDeGhfq9uh'
  config.auth_method        = :oauth
end



TweetStream::Client.new.track(*ARGV) do |status| 
  uri = 'http://localhost:3000/catcher/message' 
  params = {
    text: status.text,
    author: status.user.screen_name,
    source: 'twitter'
  }
  HTTP.get(uri, params: params)
end