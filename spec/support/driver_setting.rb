RSpec.configure do |config|
  config.before(:each, type: :system) do
    # Spec実行時、ブラウザが自動で立ち上がり挙動を確認できる
    # driven_by(:selenium_chrome)

    # Spec実行時、ブラウザOFF
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
    #Rspecのwarn解消
    Selenium::WebDriver.logger.ignore(:browser_options)
  end
end