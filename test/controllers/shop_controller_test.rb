require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get shop_items_url
    assert_response :success
  end

end
