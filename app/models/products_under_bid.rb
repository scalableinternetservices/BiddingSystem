require 'date'

class ProductsUnderBid < ApplicationRecord
    
    belongs_to :product
    
    validates :product_id, :presence => true
    validates :minimum_bidding_price, :presence => true
    validates :bid_status, :inclusion => { :in => [true, false]}
    validates :sell_status, :inclusion => { :in => [true, false]}
    
    @maximum_bidding_price = 0
    self.primary_key = 'product_bid_id'

    def self.start_bid?(product_id, minimum_bidding_price, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        # Don't allow starting bid on sold products
        product_under_bid = ProductsUnderBid.where(:product_id => product_id).first
        if !product_under_bid.nil?
            sell_status = product_under_bid.sell_status
            if sell_status == true
                return
            end
        end
        
        # Default bid start date and time is current date and time
        if bid_start_date == nil && bid_start_time == nil
            bid_start_date = Date.today.to_formatted_s(:date)
            bid_start_time = Time.zone.now.to_formatted_s(:time)
        end

        # Start the bid
        product_under_bid = ProductsUnderBid.new(product_id: product_id, minimum_bidding_price: minimum_bidding_price, maximum_bidding_price: 0, 
                                                bid_status: true, sell_status: false, bid_start_date: bid_start_date, 
                                                bid_start_time: bid_start_time, bid_end_date: bid_end_date, bid_end_time: bid_end_time)
        product_under_bid.save
    end
    
    def self.stop_bid?(product_bid_id)
        product_under_bid_record = ProductsUnderBid.find(product_bid_id)
        product_under_bid_record.update_attributes(:bid_status => false , :sell_status => true)
        product_under_bid_record.save!
        decide_winner(product_under_bid_record)
    end

    def self.get_products_under_bid
        Product.select("*").joins(:products_under_bid).where("products_under_bids.bid_status" => true)
    end
    
    def self.search_products_under_bid(name: "", category_id: 0, location_id: 0, highest_bid: 0)
        result = Product.select("*").joins(:products_under_bid)
        
        if(!name.blank?)
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
    
    def self.decide_winner(product_under_bid_record)
        # Get a list of active bids on this product
        highest_active_bid_record = Bid.where("product_id" => product_under_bid_record.product_id, "bid_active" => true)
                                        .order(bid_amount: :desc)
                                        .limit(1)
        if !highest_active_bid_record.blank?
            highest_active_bid = highest_active_bid_record.first
            winner_id = highest_active_bid.user_id
            product_under_bid_record.update_attribute(:winner_id, winner_id)
        end
    end
    
    def self.decide_winner_when_bid_time_ends
        
        ProductsUnderBid.all.each do |products_under_bid|
            if !products_under_bid.sell_status
                bid_end_date = products_under_bid.bid_end_date
                bid_end_time = products_under_bid.bid_end_time

                time = bid_end_time.hour.to_s + ":" + bid_end_time.min.to_s + ":" + bid_end_time.sec.to_s
                date_time = bid_end_date.to_s + " " + time
                bid_end_date_time = Time.zone.parse(date_time).utc

                if bid_end_date_time != nil
                    flag_expired = Time.now > bid_end_date_time
                    
                    if flag_expired
                        products_under_bid.update_attributes(:bid_status => false , :sell_status => true)
                        products_under_bid.save!
                        highest_active_bid_record = Bid.where("product_id" => products_under_bid.product_id, "bid_active" => true)
                                                .order(bid_amount: :desc)
                                                .limit(1)
                        if !highest_active_bid_record.blank?
                            highest_active_bid = highest_active_bid_record.first
                            winner_id = highest_active_bid.user_id
                            products_under_bid.update_attribute(:winner_id, winner_id)
                            products_under_bid.save!
                        end
                    end
                end
            end
        end
    end
    
end
