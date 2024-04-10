require "test_helper"

class Admin::StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_static_pages_update_url
    assert_response :success
  end
end
