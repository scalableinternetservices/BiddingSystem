json.array!(@bids) do |bid|
  json.extract! bid, :id, :product_id, :user_id, :bid_amount, :bidding_date, :bidding_time
  json.url bid_url(bid, format: :json)
end
