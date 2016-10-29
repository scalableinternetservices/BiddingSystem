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
    end

end