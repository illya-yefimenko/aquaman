require 'test_helper'

class FloatsControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get floats_read_url
    assert_response :success
  end

  test "should get write" do
    get floats_write_url
    assert_response :success
  end

end
