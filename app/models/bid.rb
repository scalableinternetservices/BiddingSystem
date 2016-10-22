class Bid < ApplicationRecord
  self.primary_key='bid_id'
  
  def self.place_bid?(product_id,user_id,bid_amount)
    bidding_date = Date.today.to_formatted_s(:date)
    bidding_time = Time.zone.now.to_formatted_s(:time)
    if(bid_amount>get_highest_bid1(product_id))
      bid = Bid.new(product_id: product_id,user_id: user_id,bid_amount: bid_amount, bidding_date: bidding_date, bidding_time: bidding_time)
      bid.save
      return true
    else
      return false
    end
  end
  
  def self.revoke_bid?(pid,uid)
    bid=Bid.where("product_id" => pid, "user_id" => uid).last
    bid.delete
  end
  
  def self.get_highest_bid1(product_id)
    @highbid=Bid.where("product_id < ?",product_id).order("bid_amount DESC").first
    return @highbid.bid_amount
  end
  
  def self.get_all_bids1(product_id)
    @list=Bid.where("product_id < ?",product_id)
    return @list
  end
  
  def self.get_bids_by_user1(user_id)
    @list=Bid.where("user_id <?", user_id)
    return @list
  end
end
