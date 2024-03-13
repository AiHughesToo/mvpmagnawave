require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get tv-view" do
    get pages_tv-view_url
    assert_response :success
  end
end
