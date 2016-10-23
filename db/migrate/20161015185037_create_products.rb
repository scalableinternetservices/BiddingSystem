class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products, id: false do |t|
      t.primary_key :product_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.date :date_added
      t.string :location
      t.belongs_to :category, index: true, foreign_key: true  
      t.references :category, index: true

      t.timestamps
    end
  end
end
