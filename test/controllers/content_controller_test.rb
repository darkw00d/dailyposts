require 'test_helper'

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get content_view_url
    assert_response :success
  end

end
