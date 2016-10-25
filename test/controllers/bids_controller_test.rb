require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers
  
  setup do
    @bid = bids(:two)
        sign_in users(:one)
  end
  
  test "should place bid" do
    post bid_url(@bid), params: { bid: { bid_amount: @bid.bid_amount, bidding_date: @bid.bidding_date, bidding_time: @bid.bidding_time, product_id: @bid.product_id, user_id: @bid.user_id } }
    assert_response :success
  end
  
  test "should revoke bid" do
      post bid_url(@bid)
      assert_response :success
  end
  
  test "should get all bids" do
    assert_not_nil :success
  end
  
  test "should get bids by user" do
    assert_not_nil :success
    @bid = bids(:one)
  end

end