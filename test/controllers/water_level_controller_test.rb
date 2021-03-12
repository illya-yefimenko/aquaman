require 'test_helper'

class WaterLevelControllerTest < ActionDispatch::IntegrationTest
  test "should get shouldfill" do
    get water_level_shouldfill_url
    assert_response :success
  end

  test "should get index" do
    get water_level_index_url
    assert_response :success
  end

end
