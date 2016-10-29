
class ProductsUnderBid < ApplicationRecord
    
    belongs_to :product
    
    validates :product_id, :presence => true
    validates :minimum_bidding_price, :presence => true
    validates :bid_status, :inclusion => { :in => [true, false]}
    validates :sell_status, :inclusion => { :in => [true, false]}
    
    @maximum_bidding_price = 0
    self.primary_key = 'product_bid_id'

    def self.start_bid?(product_id, minimum_bidding_price, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        
        if bid_start_date == nil && bid_start_time == nil
            bid_start_date = Date.today.to_formatted_s(:date)
            bid_start_time = Time.zone.now.to_formatted_s(:time)
        end
        
        bid_status = true
        sell_status = false
        product_under_bid = ProductsUnderBid.new(product_id: product_id, minimum_bidding_price: minimum_bidding_price, 
                                                bid_status: bid_status, sell_status: sell_status, bid_start_date: bid_start_date, 
                                                bid_start_time: bid_start_time, bid_end_date: bid_end_date, bid_end_time: bid_end_time)
        product_under_bid.save
    end
    
    def self.stop_bid?(product_bid_id)
        puts "---------------------------------products_under_bids.rb------------------------------------------"
        puts product_bid_id
        product_under_bid = ProductsUnderBid.find(product_bid_id)
        product_under_bid.update_attributes(:bid_status => false , :sell_status => true)
        product_under_bid.save
    end

    def self.get_products_under_bid
        products_under_bid = Product.joins(:products_under_bid).where("products_under_bids.bid_status" => true)
    end
    
    def self.search_products_under_bid(name: "", category_id: 0, location_id: 0, highest_bid: 0)
        result = Product.select("*").joins(:products_under_bid)
        
        if(name != "")
            result = result.where('products.name' => name)
        end
        
        if(category_id != 0)
            result = result.where('products.category_id' => category_id)
        end
        
        if(location_id != 0)
            result = result.where('products.location_id' => location_id)
        end

        if(highest_bid != 0)
            result = result.where("products_under_bids.maximum_bidding_price >= ?", 8).order("maximum_bidding_price DESC")
        end
        
        result
    end
end
