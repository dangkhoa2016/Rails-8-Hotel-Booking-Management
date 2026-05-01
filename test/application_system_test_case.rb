require "test_helper"

Capybara.register_driver :headless_chrome_ci do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless=new")
  options.add_argument("--window-size=1400,1400")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--disable-gpu")
  options.add_argument("--disable-extensions")
  options.add_argument("--disable-plugins")
  options.add_argument("--disable-crash-reporter")
  options.add_argument("--disable-sync")
  options.add_argument("--metrics-recording-only")
  options.add_argument("--mute-audio")
  options.add_argument("--remote-debugging-port=9222")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :headless_chrome_ci

  # Disable automatic screenshot on failure to avoid Chrome crashes
  def take_failed_screenshot
    # Override to prevent screenshot attempts that crash Chrome
  end
end

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:three))
  end
end
