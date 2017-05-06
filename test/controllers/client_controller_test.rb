require 'test_helper'

class ClientControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get client_name_url
    assert_response :success
  end

  test "should get order" do
    get client_order_url
    assert_response :success
  end

end
