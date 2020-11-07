require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get validate_user" do
    get user_validate_user_url
    assert_response :success
  end

end
