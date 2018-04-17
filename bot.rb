#
# Sample Twitter bot
#


# Require specified gems
require 'bundler'
Bundler.require(:default)

# Setup a Twitter client
client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

sample_tweets = [
  'Tweet number one',
  'Tweet number two',
  'Tweet number three',
  '...'
].freeze

scheduler = Rufus::Scheduler.new
puts "Starting scheduler for every hour".green

# Every hour, first run in 10 seconds from now
scheduler.every '1h', first_in: Time.now + 10 do

  tuit = sample_tweets.sample

  puts "tweeting..."
  client.update tuit
end

scheduler.join
