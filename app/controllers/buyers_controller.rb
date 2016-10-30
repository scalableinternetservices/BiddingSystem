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
        get_already_placed_bids(@matching_products)
    end
    
    def ongoing_auctions
        @products_under_bid = ProductsUnderBid.get_products_under_bid
        get_already_placed_bids(@products_under_bid)
    end
    
    def place_new_bid
        @product_id = params[:product_id]
        @highest_bid = params[:highest_bid]
    end
    
    def place_bid
        product_id = params[:bid][:product_id].to_i
        bid_amount = params[:bid][:bid_amount].to_f
        user_id = 1337
        Bid.place_bid(product_id, user_id, bid_amount)
        
        redirect_to :action => 'ongoing_auctions' and return
    end
    
    def revoke_bid
        product_id = params[:product_id].to_i
        user_id = 1337
        Bid.revoke_bid(product_id, user_id)
        
        redirect_to :action => 'ongoing_auctions' and return
    end
    
    private
    
    def get_already_placed_bids(products)
        @already_placed_bid = []
        user_id = 1337
        products.each do |product|
            placed_bid = Bid.where('product_id' => product.product_id, "user_id" => user_id, "bid_active" => true)
            if !placed_bid.blank?
                @already_placed_bid << placed_bid.first.bid_amount
            else
                @already_placed_bid << 0
            end
        end    
    end
end