require "test_helper"

class LikeGossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get like_gossips_create_url
    assert_response :success
  end

  test "should get destroy" do
    get like_gossips_destroy_url
    assert_response :success
  end
end
