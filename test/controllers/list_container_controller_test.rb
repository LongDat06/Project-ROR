require "test_helper"

class ListContainerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get list_container_show_url
    assert_response :success
  end
end
