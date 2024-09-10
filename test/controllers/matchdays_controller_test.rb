require "test_helper"

class MatchdaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matchday_index_url
    assert_response :success
  end

  test "should get show" do
    get matchday_show_url
    assert_response :success
  end
end
