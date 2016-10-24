class CreateProductsUnderBids < ActiveRecord::Migration[5.0]
  def change
    create_table :products_under_bids, id: false do |t|
      t.primary_key :product_bid_id
      t.integer :product_id
      t.float :minimum_bidding_price
      t.float :maximum_bidding_price
      t.boolean :bid_status
      t.boolean :sell_status
      t.date :bid_start_date
      t.time :bid_start_time
      t.date :bid_end_date
      t.time :bid_end_time
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
