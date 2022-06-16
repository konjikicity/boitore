Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_SECRET']
  OmniAuth.config.allowed_request_methods = [:get, :post]
  OmniAuth.config.silence_get_warning = true
end