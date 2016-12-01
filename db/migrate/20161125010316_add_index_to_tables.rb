class AddIndexToTables < ActiveRecord::Migration[5.0]
  def change
    add_index :products, :user_id
    add_index :products, :location_id
    add_index :bids, :user_id
    add_index :bids, :product_id
    add_index :bids, :bid_active
    add_index :products_under_bids, [:bid_status, :sell_status]
  end
end
