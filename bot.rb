#
# Sample Twitter bot
#


# Require specified gems
require 'bundler'
Bundler.require(:default)

# Sets api access keys
CONSUMER_KEY = "XXXXXXXXXXXXXX".freeze
CONSUMER_SECRET = "XXXXXXXXXXXXXXX".freeze
ACCESS_TOKEN = "XXXXXXXXXXXXX".freeze
ACCESS_TOKEN_SECRET = "XXXXXXXXXXXXXXXX".freeze

# Setup a Twitter client
client = Twitter::REST::Client.new do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.access_token = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

sample_tweets = [
  'Probando desde la terminal.',
  'Tuit enviado desde mi bot.',
  'Probando, probando, uno, dos...'
].freeze

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do

  puts "Starting scheduler for every hour"
  tuit = sample_tweets.sample

  puts "tweeting..."
  client.update tuit
end

scheduler.join
