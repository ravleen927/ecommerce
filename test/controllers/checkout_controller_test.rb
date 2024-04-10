require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkout_index_url
    assert_response :success
  end

  test "should get show" do
    get checkout_show_url
    assert_response :success
  end
end
