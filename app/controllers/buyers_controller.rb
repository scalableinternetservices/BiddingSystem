class BuyersController < UsersController

    def search
    end
    
    def search_products
        search_name = params[:search][:name]
        search_category = params[:search][:category_id].to_i
        search_location_id = params[:search][:location_id].to_i
        search_highest_bid = params[:search][:highest_bid].to_f
        @matching_products = ProductsUnderBid.search_products_under_bid(name: search_name, category_id: search_category, 
                                                                        location_id: search_location_id, highest_bid: search_highest_bid)
    end
    
    def ongoing_auctions
        @products_under_bid = ProductsUnderBid.get_products_under_bid
        @already_placed_bid = []
        @products_under_bid.each do |product_under_bid|
            placed_bid = Bid.where('bids.product_id' => product_under_bid.product_id)
            if placed_bid.count == 1
                @already_placed_bid << placed_bid.first.bid_amount
            else
                @already_placed_bid << 0
            end
        end
    end
    
    def place_new_bid
        @product_id = params[:product_id]
        @highest_bid = params[:highest_bid]
    end

    def revoke_old_bid
        
    end
    
    def place_bid
        product_id = params[:bid][:product_id].to_i
        bid_amount = params[:bid][:bid_amount].to_f
        Bid.place_bid(product_id, 1337, bid_amount)
        
        redirect_to :action => 'ongoing_auctions' and return
    end
    
    def revoke_bid
        
    end
end