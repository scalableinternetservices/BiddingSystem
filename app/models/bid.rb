class Bid < ApplicationRecord
  
  belongs_to :product
  self.primary_key='bid_id'
  
  validates :product_id, :presence => true
  validates :user_id, :presence => true
  validates :bid_amount, :presence => true
  validates :bidding_date, :presence => true
  validates :bidding_time, :presence => true
  validates :bid_active, :presence => true
  
  def self.place_bid? (product_id, user_id, bid_amount)
    
    bidding_date = Date.current.to_formatted_s(:date)
    bidding_time = Time.zone.now.to_formatted_s(:time)
    
    product_record = ProductsUnderBid.where("product_id " => product_id)
    current_high = product_record.maximum_bidding_price
    
    if( bid_amount > current_high )
      
      if Bid.exists?(:user_id => user_id)
        bid_success = Bid.update_attributes(:bid_amount => bid_amount, :bidding_date => bidding_date, :bidding_time => bidding_time)
      else
        bid = Bid.new(product_id: product_id, user_id: user_id, bid_amount: bid_amount, bidding_date: bidding_date, bidding_time: bidding_time, bid_active: true)
        bid_success = bid.save!
      end
      update_success = productrecord.update_attribute(:maximum_bidding_price, bid_amount)
    end
      update_success && bid_success
  end

  
  def self.revoke_bid? (pid, uid)
    
    bidrecord = Bid.where("product_id" => pid, "user_id" => uid)
    bidrecord = bidrecord.update_attribute(:bid_active, false)
    
  end

  
  def self.get_all_the_bids (product_id)
    
    list = Bid.where("product_id " => product_id)
    
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