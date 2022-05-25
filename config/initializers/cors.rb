Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 本番環境
    origins ENV['VUE_APP_API_ORIGIN']

    # test環境
    # origins '*'

    resource '*',
             headers: :any,
             expose: %w[access-token expiry token-type uid client],
             methods: %i[get post put patch delete options head]
  end
end
