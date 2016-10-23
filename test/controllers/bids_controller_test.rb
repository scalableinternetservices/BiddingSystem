require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    get bids_url
    if @current_user
      assert_response :success
    end
  end

  test "should get new" do
    get new_bid_url
    if @current_user
      assert_response :success
    end
  end

  test "should create bid" do
    if @current_user
      assert_difference('Bid.count') do
        post bids_url, params: { bid: { bid_amount: @bid.bid_amount, bidding_date: @bid.bidding_date, bidding_time: @bid.bidding_time, product_id: @bid.product_id, user_id: @bid.user_id } }
      end
      assert_redirected_to bid_url(Bid.last)
    end
  end

  test "should show bid" do
    get bid_url(@bid)
    if @current_user
      assert_response :success
    end
  end

  test "should get edit" do
    get edit_bid_url(@bid)
    if @current_user
      assert_response :success
    end
  end

  test "should update bid" do
    patch bid_url(@bid), params: { bid: { bid_amount: @bid.bid_amount, bidding_date: @bid.bidding_date, bidding_time: @bid.bidding_time, product_id: @bid.product_id, user_id: @bid.user_id } }
    if @current_user
      assert_redirected_to bid_url(@bid)
    end
  end

  test "should destroy bid" do
    if @current_user
      assert_difference('Bid.count', -1) do
        delete bid_url(@bid)
      end
      assert_redirected_to bids_url
    end
  end
end
