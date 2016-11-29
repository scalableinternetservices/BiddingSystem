class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories, id: false do |t|
      t.primary_key :category_id
      t.string :name
      t.text :description
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
    end
  end
end