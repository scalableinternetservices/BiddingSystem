class Bid < ApplicationRecord
  belongs_to :product
  self.primary_key='bid_id'
  
  def self.place_bid(product_id,user_id,bid_amount)
    bidding_date = Date.current.to_formatted_s(:date)
    bidding_time = Time.zone.now.to_formatted_s(:time)
    productrecord = ProductsUnderBid.where("product_id " => product_id)
    current_high=productrecord.maximum_bidding_price
    if(bid_amount>current_high)
      bid = Bid.new(product_id: product_id,user_id: user_id,bid_amount: bid_amount, bidding_date: bidding_date, bidding_time: bidding_time)
      productrecord.update_attribute(:maximum_bidding_price, bid_amount)
      return bid.save!
    end
  end

  
  def self.revoke_bid(pid,uid)
    bidrecords=Bid.where("product_id" => pid, "user_id" => uid)
    if !bidrecords.blank?
      bidobject=bidrecords.last
      if bidobject.delete
        return true
      end
    end
  end

  
  def self.get_all_the_bids(product_id)
    list=Bid.where("product_id " => product_id)
    if !list.blank?
      return list
    end
  end
  
  def self.get_bids_for_user(user_id)
    list=Bid.where("user_id " => user_id)
    if !list.blank?
      return list
    end
  end

end