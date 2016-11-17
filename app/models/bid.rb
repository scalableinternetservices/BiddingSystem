class Bid < ApplicationRecord
  
  belongs_to :product
  self.primary_key = 'bid_id'
  
  validates :product_id, :presence => true
  validates :user_id, :presence => true
  validates :bid_amount, :presence => true
  validates :bidding_date, :presence => true
  validates :bidding_time, :presence => true
  validates_inclusion_of :bid_active, in: [true, false]
  
  def self.place_bid (product_id, user_id, bid_amount)
    
    bidding_date = Date.current.to_formatted_s(:date)
    bidding_time = Time.zone.now.to_formatted_s(:time)
    
    product_record = ProductsUnderBid.where("product_id" => product_id)
    current_high = product_record.first.maximum_bidding_price
    
    if bid_amount > current_high
      bid_record = Bid.where(:product_id => product_id, :user_id => user_id)
      
      if !bid_record.blank?
        bid = bid_record.first
        bid_success = bid.update_attributes(:bid_amount => bid_amount, :bidding_date => bidding_date, :bidding_time => bidding_time, bid_active: true)
      else
        bid = Bid.new(product_id: product_id, user_id: user_id, bid_amount: bid_amount, bidding_date: bidding_date, bidding_time: bidding_time, bid_active: true)
        bid_success = bid.save!
      end
      
      update_success = product_record.first.update_attribute(:maximum_bidding_price, bid_amount)
    end
      update_success && bid_success
      
  end

  
  def self.revoke_bid (product_id, user_id)
    
    bid_record = Bid.where("product_id" => product_id, "user_id" => user_id, "bid_active" => true)
    
    if !bid_record.blank?
      bid = bid_record.first
      bid_amount = bid.bid_amount
      bid.update_attribute(:bid_active, false)
      
      product_record = ProductsUnderBid.where("product_id" => product_id)
      if !product_record.blank?
        product = product_record.first
        
        highest_active_bid_record = Bid.where("product_id" => product_id, "bid_active" => true)
                                        .order(bid_amount: :desc)
                                        .limit(1)
        if !highest_active_bid_record.blank?
          highest_active_bid = highest_active_bid_record.first
          highest_active_bid_amount = highest_active_bid.bid_amount

          if bid_amount > highest_active_bid_amount
              product.update_attribute(:maximum_bidding_price, highest_active_bid_amount)
          end
          
        else
            product.update_attribute(:maximum_bidding_price, 0)
        end
      end
    end
    
  end

  
  def self.get_all_the_bids (product_id)
    
    list = Bid.where("product_id" => product_id)
    if !list.blank?
      return list
    end
    
  end
  
  def self.get_bids_for_user (user_id)
    
    list = Bid.where("user_id " => user_id)
    
    if !list.blank?
      return list
    end
    
  end

end