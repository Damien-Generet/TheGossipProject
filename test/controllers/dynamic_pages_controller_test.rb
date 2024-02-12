require "test_helper"

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get dynamic_pages_welcome_url
    assert_response :success
  end
end
