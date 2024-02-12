require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new_gossip" do
    get static_pages_new_gossip_url
    assert_response :success
  end

  test "should get index_gossips" do
    get static_pages_index_gossips_url
    assert_response :success
  end
end
