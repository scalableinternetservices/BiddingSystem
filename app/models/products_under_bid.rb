class ProductsUnderBid < ApplicationRecord
    
    validates :product_id, :presence => true
    validates :minimum_bidding_price, :presence => true
    validates :bid_status, :inclusion => { :in => [true, false]}
    validates :sell_status, :inclusion => { :in => [true, false]}
    
    self.primary_key = 'product_bid_id'

    def start_bid?
        self.bid_start_date = Date.today.to_formatted_s(:date)
        self.bid_start_time = Time.zone.now.to_formatted_s(:time)
        self.bid_status = true 
        self.bid_start_date != nil && @bid_start_time !=nil
    end
    
    def stop_bid?
        self.bid_end_date = Date.today.to_formatted_s(:date)
        self.bid_end_time = Time.zone.now.to_formatted_s("12:23")
        self.bid_end_date != nil && @bid_end_time !=nil
    end

    def self.get_products_under_bid
        bid_items = ProductsUnderBid.where("bid_status" => true)
        
        products_under_bid_list ||= []
        bid_items.each do |bid_item|
            products_under_bid_list << bid_item
        end
        products_under_bid_list
    end
    
    def search_products_under_bid
        
    end
end

