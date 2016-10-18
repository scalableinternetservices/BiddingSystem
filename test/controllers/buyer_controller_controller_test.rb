require 'test_helper'

class BuyerControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get place_bid" do
    get buyer_controller_place_bid_url
    assert_response :success
  end

  test "should get revoke_bid" do
    get buyer_controller_revoke_bid_url
    assert_response :success
  end

  test "should get get_highest_bid" do
    get buyer_controller_get_highest_bid_url
    assert_response :success
  end

  test "should get get_all_bids" do
    get buyer_controller_get_all_bids_url
    assert_response :success
  end

  test "should get get_bids_by_user" do
    get buyer_controller_get_bids_by_user_url
    assert_response :success
  end

end
