class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.date :date_added
      t.string :location

      t.timestamps
    end
  end
end
