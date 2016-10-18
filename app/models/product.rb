class Product < ApplicationRecord
    
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :date_added, presence: true
    
    self.primary_key = 'product_id'
    
end
