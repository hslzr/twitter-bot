#
# Sample Twitter bot
#


# Require specified gems
require 'bundler'
require 'yaml'
Bundler.require(:default)

# Setup a Twitter client

bot_config = YAML.load_file(File.join(__dir__, 'access_keys.yml'))

client = Twitter::REST::Client.new do |config|
  config.consumer_key = bot_config['CONSUMER_KEY']
  config.consumer_secret = bot_config['CONSUMER_SECRET']
  config.access_token = bot_config['ACCESS_TOKEN']
  config.access_token_secret = bot_config['ACCESS_TOKEN_SECRET']
end

sample_tweets = [
  'Tweet number one',
  'Tweet number two',
  'Tweet number three',
  '...'
].freeze

scheduler = Rufus::Scheduler.new

# Every hour, first run in 10 seconds from now
scheduler.every '1h', first_in: Time.now + 10 do
  client.update sample_tweets.sample
end

scheduler.join
