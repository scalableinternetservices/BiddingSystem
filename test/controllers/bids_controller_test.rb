require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid = bids(:one)
  end
  
  test "should place bid" do
    post bid_url(@bid), params: { bid: { bid_amount: @bid.bid_amount, bidding_date: @bid.bidding_date, bidding_time: @bid.bidding_time, product_id: @bid.product_id, user_id: @bid.user_id } }
    assert_response :success
  end

end