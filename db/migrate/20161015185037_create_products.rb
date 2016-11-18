class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products, id: false do |t|
      t.primary_key :product_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.date :date_added
      t.integer :location_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.belongs_to :category, index: true
    end
  end
end
