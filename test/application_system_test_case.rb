require "test_helper"

Capybara.register_driver :headless_chrome_ci do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless=new")
  options.add_argument("--window-size=1400,1400")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--disable-gpu")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :headless_chrome_ci
end

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:three))
  end
end
