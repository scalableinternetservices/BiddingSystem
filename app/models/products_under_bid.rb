class ProductsUnderBid < ApplicationRecord
    
    attr_accessor :product_bid_id, :product_id, :minimum_bidding_price, :bid_status, :sell_status, :bid_start_date, :bid_start_time, :bid_end_date, :bid_end_time
    
    def initialize(product_id, minimum_bidding_price, bid_status, sell_status, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        self.product_id = product_id
        self.minimum_bidding_price = minimum_bidding_price
        self.bid_status = bid_status
        self.sell_status = sell_status
        self.bid_start_date = bid_start_date
        self.bid_start_time = bid_start_time
        self.bid_end_date = bid_end_date
        self.bid_end_time = bid_end_time
    end
    '''validatesto :product_id, :presence => true
    validates :minimum_bidding_price, :presence => true
    validates :bid_status, :inclusion => { :in => [true, false]}
    validates :sell_status, :inclusion => { :in => [true, false]}
    validates :bid_start_date, :allow_blank => true
    validates :bid_start_time, :allow_blank => true'''
    
    self.primary_key = 'product_bid_id'

    def self.start_bid?(product_id, minimum_bidding_price, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        
        if bid_start_date == nil && bid_start_time == nil
            bid_start_date = Date.today.to_formatted_s(:date)
            bid_start_time = Time.zone.now.to_formatted_s(:time)
        end
        bid_status = true
        sell_status = false
        puts product_id, minimum_bidding_price, bid_status, sell_status, bid_start_date, bid_start_time, bid_end_date, bid_end_time
        
        product_under_bid = ProductsUnderBid.new(product_id, minimum_bidding_price, bid_status, sell_status, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        puts product_under_bid.product_id, product_under_bid.minimum_bidding_price, product_under_bid.bid_start_date, product_under_bid.bid_start_time
        
        
        if product_under_bid.valid?
            product_under_bid.save
        end
        
        product_under_bid.valid?
    end
    
    def self.stop_bid?(product_bid_id)
        product_under_bid = ProductsUnderBid.find(product_bid_id)
        product_under_bid.update_attributes(:bid_status => false , :sell_status => true)
        product_under_bid.save
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

