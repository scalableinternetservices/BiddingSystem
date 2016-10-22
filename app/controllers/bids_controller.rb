class BidsController < ApplicationController
    def place_bid
      product_id=params[:bid][:product_id]
      user_id=params[:bid][:user_id]
      bid_amount=params[:bid][:bid_amount]
      
      bid_placed=Bid.place_bid?(product_id,user_id,bid_amount)
      if bid_placed
        puts "Your bid has been placed succesfully!"
      end
    end
    
    def revoke_bid
      product_id=params[:bid][:product_id]
      user_id=params[:bid][:user_id]
      
      bid_revoked=Bid.revoke_bid?(product_id,user_id)
      if bid_revoked
        puts "Bid cancelled!"
      end
    end
    
    def get_highest_bid
      product_id=params[:bid][:product_id]
      
      highest_bid=Bid.get_highest_bid1(product_id)
      puts "The highest bid on the product is :"
      puts highest_bid
    end
    
    def get_all_bids
      product_id=params[:bid][:product_id]
      
      @bidslist=Bid.get_all_bids1(product_id)
      @bidslist.each do |bid|
        bid.show
      end
    end
    
    def get_bids_by_user
      user_id=params[:bid][:user_id]
      
      @bidslist=Bid.get_bids_by_user1(user_id)
      @bidslist.each do |bid|
        bid.show
      end
    end
    
    def new
      @bid = Bid.new
    end
    def show
      @bid=Bid.find(params[:bid_id])
    end
end