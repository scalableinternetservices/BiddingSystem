json.array!(@products_under_bids) do |products_under_bid|
  json.extract! products_under_bid, :id, :product_bid_id, :product_id, :minimum_bidding_price, :bid_status, :sell_status, :bid_start_date, :bid_start_time, :bid_end_date, :bid_end_time
  json.url products_under_bid_url(products_under_bid, format: :json)
end
