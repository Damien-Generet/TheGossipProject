require "test_helper"

class LikegossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get likegossips_create_url
    assert_response :success
  end

  test "should get destroy" do
    get likegossips_destroy_url
    assert_response :success
  end
end
