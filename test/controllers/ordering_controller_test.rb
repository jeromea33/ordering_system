require 'test_helper'

class OrderingControllerTest < ActionController::TestCase
  test "should get menu" do
    get :menu
    assert_response :success
  end

  test "should get orders" do
    get :orders
    assert_response :success
  end

end
