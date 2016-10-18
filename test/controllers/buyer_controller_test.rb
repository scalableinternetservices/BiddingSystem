require 'test_helper'

class BuyerControllerTest < ActionDispatch::IntegrationTest
  test "should get place_bid" do
    get buyer_place_bid_url
    assert_response :success
  end

  test "should get revoke_bid" do
    get buyer_revoke_bid_url
    assert_response :success
  end

  test "should get get_highest_bid" do
    get buyer_get_highest_bid_url
    assert_response :success
  end

  test "should get get_all_bids" do
    get buyer_get_all_bids_url
    assert_response :success
  end

  test "should get get_bids_by_user" do
    get buyer_get_bids_by_user_url
    assert_response :success
  end

end
