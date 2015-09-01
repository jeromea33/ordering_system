require 'test_helper'

class CmsControllerTest < ActionController::TestCase
  test "should get create_product" do
    get :create_product
    assert_response :success
  end

  test "should get show_product" do
    get :show_product
    assert_response :success
  end

  test "should get edit_product" do
    get :edit_product
    assert_response :success
  end

  test "should get delete_product" do
    get :delete_product
    assert_response :success
  end

  test "should get metrics" do
    get :metrics
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
