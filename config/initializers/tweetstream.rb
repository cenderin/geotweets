require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token      = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
  config.auth_method        = :oauth
end


# TweetStream::Client.new.locations('-125.00','25.0','-70.00','50.00', nil)  do |status|
# 	m = Tweet.new
# 	m.text = status.text
# 	m.created_at = status.created_at
# 	m.lat = status.geo.latitude
# 	m.lng = status.geo.longitude
# 	m.save
# 	puts "#{status.geo}"
# end

# TweetStream::Client.new.sample do |status|

#   puts status.geo.coordinates
# end