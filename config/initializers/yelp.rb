require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = Rails.application.secrets.CONSUMER_KEY
  config.consumer_secret = Rails.application.secrets.CONSUMER_SECRET
  config.token = Rails.application.secrets.TOKEN
  config.token_secret = Rails.application.secrets.TOKEN_SECRET
end

