class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :bid_id
      t.integer :added_by_user_id
      t.integer :category_id
      t.string :name
      t.date :date_added
      t.string :location

      t.timestamps
    end
  end
end
