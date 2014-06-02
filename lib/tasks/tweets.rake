require 'tweetstream'

desc "use tweetstream to save all tweets"
task "begin_save" => :environment do
  client = TweetStream::Client.new

  client.locations(-125,25,-70,50) do |status|
    if status.geo?
      @tweet = Tweet.new
      @tweet.text = status.text
      @tweet.user = status.user.screen_name 
      @tweet.location = status.geo.coordinates.reverse
      @tweet.created_at = status.created_at
      @tweet.save
      puts @tweet.text
    end
  end
end
