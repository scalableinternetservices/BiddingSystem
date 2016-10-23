class Category < ApplicationRecord
    
    has_many :products
    self.primary_key = 'category_id'
    
end
