require 'test_helper'

class HistoricalValueControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get historical_value_destroy_url
    assert_response :success
  end

end
