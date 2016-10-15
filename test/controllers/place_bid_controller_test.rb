require 'test_helper'

class PlaceBidControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get place_bid_home_url
    assert_response :success
  end

  test "should get bid" do
    get place_bid_bid_url
    assert_response :success
  end

end
