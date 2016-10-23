class Product < ApplicationRecord
    
    belongs_to :category
    has_many :bids
    has_one :products_under_bid
    
    validates_presence_of :category
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :date_added, presence: true
    
    self.primary_key = 'product_id'
    
end
