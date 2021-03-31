require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get conditions_show_url
    assert_response :success
  end

  test "should get update" do
    get conditions_update_url
    assert_response :success
  end

  test "should get create" do
    get conditions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get conditions_destroy_url
    assert_response :success
  end

end
