require 'test_helper'

class SellersControllerTest < ActionDispatch::IntegrationTest
    
  setup do
    @products_under_bid = products_under_bids(:one)
    #puts @products_under_bid.product_id.class
  end
  
  test "should start bid" do
    '''post start_bid_sellers_url, params: { products_under_bid: { product_id: @products_under_bid.product_id, minimum_bidding_price: @products_under_bid.minimum_bidding_price, 
                                        now: false, bid_start_date: @products_under_bid.bid_start_date, bid_start_time: @products_under_bid.bid_start_time, 
                                        bid_end_date: @products_under_bid.bid_end_date, bid_end_time: @products_under_bid.bid_end_time} }'''
                                        
     post start_bid_sellers_url, params: { products_under_bid: { product_id: 29, minimum_bidding_price: 56, 
                                        now: false, bid_start_date: "2016-10-18", bid_start_time: "3:30", 
                                        bid_end_date: "2016-10-18", bid_end_time: "4:40"} }
    assert_response :success
  end
  
  test "should stop bid" do
    post stop_bid_sellers_url, params: { products_under_bid: { product_bid_id: @products_under_bid.product_bid_id} }
    assert_response :success
  end
end
