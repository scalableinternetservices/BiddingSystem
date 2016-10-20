class Bid < ApplicationRecord
    
    self.primary_key = 'bid_id'
    validates :user_id, presence: true
    validates :bid_amount, presence: true

    
    
end

def self.get_bid
    temp=Bid.where("product_id" => 4)
    curr_bid=temp.bid_amount
    curr_bid
end