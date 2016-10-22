class Bid < ApplicationRecord
  self.primary_key='bid_id'
  
  def self.place_bid?(product_id,user_id,bid_amount)
    bidding_date = Date.today.to_formatted_s(:date)
    bidding_time = Time.zone.now.to_formatted_s(:time)
    bid = Bid.new(product_id: product_id,user_id: user_id,bid_amount: bid_amount, bidding_date: bidding_date, bidding_time: bidding_time)
    bid.save
  end
  
  def self.revoke_bid?(product_id,user_id)
    bid=Bid.where(user_id => user_id, product_id => product_id).last
    bid.delete
  end
  
  def self.get_highest_bid?(product_id)
    highbid=Bid.order(bid_amount: :desc).offset(0)
    highbid.show
  end
  
  def self.get_all_bids?(product_id)
    list=Bid.where(product_id => product_id)
    return list
  end
  
  def self.get_bids_by_user?(user_id)
    list=Bid.where(user_id => user_id)
    return list
  end
end
