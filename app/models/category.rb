class Category < ApplicationRecord
    
    has_many :product
    self.primary_key = 'category_id'
    
end
