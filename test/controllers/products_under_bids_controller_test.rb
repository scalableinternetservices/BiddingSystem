require 'test_helper'

class ProductsUnderBidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_under_bid = products_under_bids(:one)
  end

  test "should get index" do
    get products_under_bids_url
    assert_response :success
  end

  test "should get new" do
    get new_products_under_bid_url
    assert_response :success
  end

  test "should create products_under_bid" do
    assert_difference('ProductsUnderBid.count') do
      post products_under_bids_url, params: { products_under_bid: { bid_end_date: @products_under_bid.bid_end_date, bid_end_time: @products_under_bid.bid_end_time, bid_start_date: @products_under_bid.bid_start_date, bid_start_time: @products_under_bid.bid_start_time, bid_status: @products_under_bid.bid_status, minimum_bidding_price: @products_under_bid.minimum_bidding_price, product_bid_id: @products_under_bid.product_bid_id, product_id: @products_under_bid.product_id, sell_status: @products_under_bid.sell_status } }
    end

    assert_redirected_to products_under_bid_url(ProductsUnderBid.last)
  end

  test "should show products_under_bid" do
    get products_under_bid_url(@products_under_bid)
    assert_response :success
  end

  test "should get edit" do
    get edit_products_under_bid_url(@products_under_bid)
    assert_response :success
  end

  test "should update products_under_bid" do
    patch products_under_bid_url(@products_under_bid), params: { products_under_bid: { bid_end_date: @products_under_bid.bid_end_date, bid_end_time: @products_under_bid.bid_end_time, bid_start_date: @products_under_bid.bid_start_date, bid_start_time: @products_under_bid.bid_start_time, bid_status: @products_under_bid.bid_status, minimum_bidding_price: @products_under_bid.minimum_bidding_price, product_bid_id: @products_under_bid.product_bid_id, product_id: @products_under_bid.product_id, sell_status: @products_under_bid.sell_status } }
    assert_redirected_to products_under_bid_url(@products_under_bid)
  end

  test "should destroy products_under_bid" do
    assert_difference('ProductsUnderBid.count', -1) do
      delete products_under_bid_url(@products_under_bid)
    end

    assert_redirected_to products_under_bids_url
  end
end
