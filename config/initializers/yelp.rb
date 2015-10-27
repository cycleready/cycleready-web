require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = Rails.application.secrets.YELP_CONSUMER_KEY
  config.consumer_secret = Rails.application.secrets.YELP_CONSUMER_SECRET
  config.token = Rails.application.secrets.YELP_TOKEN
  config.token_secret = Rails.application.secrets.YELP_TOKEN_SECRET
end
