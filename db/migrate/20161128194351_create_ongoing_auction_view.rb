class CreateOngoingAuctionView < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE MATERIALIZED VIEW ongoing_auctions AS
      SELECT products.product_id, category_id, name, date_added, location_id, maximum_bidding_price
      FROM products
      INNER JOIN products_under_bids ON products_under_bids.product_id = products.product_id
      WHERE products_under_bids.bid_status = true
    SQL
  end
  
  def down
    execute "DROP MATERIALIZED VIEW IF EXISTS ongoing_auctions"
  end
end
