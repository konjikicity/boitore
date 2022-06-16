Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_API_KEY'], ENV['GOOGLE_SECRET']
  OmniAuth.config.allowed_request_methods = [:get, :post]
  OmniAuth.config.silence_get_warning = true
end