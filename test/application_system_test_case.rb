require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: (ENV['CI'].present? ? :headless_chrome : :chrome), screen_size: [ 1400, 1400 ]
end
