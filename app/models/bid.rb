class Bid < ApplicationRecord
    
    
    validates :user_id, presence: true
    validates :bid_amount, presence: true

    
    self.primary_key = 'bid_id'
end
