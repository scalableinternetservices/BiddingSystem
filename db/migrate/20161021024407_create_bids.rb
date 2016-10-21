class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids, id:false do |t|
      t.primary_key :bid_id
      t.integer :product_id
      t.integer :user_id
      t.integer :bid_amount
      t.date :bidding_date
      t.time :bidding_time

      t.timestamps
    end
  end
end
