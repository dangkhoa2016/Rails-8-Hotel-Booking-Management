require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:three))
  end
end
