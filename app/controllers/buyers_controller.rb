class BuyersController < UsersController
    before_action :authenticate_user!, only: [ :bought, :my_bids, :place_new_bid, :place_bid, :revoke_bid ]
    
    def search
    end
    
    def bought
        cache_key = "bought_by_#{current_user.id}"
        user_bought_record = CACHE.get(cache_key)
        if (user_bought_record)
            @products = user_bought_record
            puts "user bought record from cache"
        else
            @products = Product.where(:user_id => current_user.id).joins('INNER JOIN products_under_bids ON products.product_id = products_under_bids.product_id').where('products_under_bids.sell_status' => true)
            CACHE.set(cache_key, @products, 3600)
            puts "user bough record from database"
        end
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
    
    def my_bids
        cache_key = "my_bids_#{current_user.id}"
        user_bids_record = CACHE.get(cache_key)
        if (user_bids_record)
            @my_bids = user_bids_record
            puts "user bids record from cache"
        else
            @my_bids = Product.select("*").joins("INNER JOIN bids ON bids.product_id = products.product_id
                                    INNER JOIN products_under_bids ON products_under_bids.product_id = products.product_id")
                                    .where('bids.user_id' => current_user.id, 'bids.bid_active' => true)
            CACHE.set(cache_key, @my_bids, 600) #user's bids list will not change within ten minutes
            puts "user bid record from database"
        end

    end
    
    def place_new_bid
        @product_id = params[:product_id]
        @highest_bid = params[:highest_bid]
    end
    
    def place_bid
        product_id = params[:bid][:product_id].to_i
        bid_amount = params[:bid][:bid_amount].to_f
        Bid.place_bid(product_id, current_user.id, bid_amount)
        redirect_to :action => 'ongoing_auctions' and return
    end
    
    def revoke_bid
        product_id = params[:product_id].to_i
        Bid.revoke_bid(product_id, current_user.id)
        redirect_to :action => 'ongoing_auctions' and return
    end
    
    private
    
    def get_already_placed_bids(products)
        @already_placed_bid = []
        products.each do |product|
            if !current_user.nil?
                cache_key = "placed_bids_#{current_user.id}"
                user_placed_bids_record = CACHE.get(cache_key)
                if (user_placed_bids_record)
                    placed_bid = user_placed_bids_record
                    puts "ongoing auction placed bid record from cache"
                else
                    placed_bid = Bid.where('product_id' => product.product_id, "user_id" => current_user.id, "bid_active" => true)
                    CACHE.set(cache_key, placed_bid, 120) #user's placed bids record will not change within two minutes
                    puts "ongoing auction placed bid record from database"
                end
                if !placed_bid.blank?
                    @already_placed_bid << placed_bid.first.bid_amount
                else
                    @already_placed_bid << 0
                end
            else
                @already_placed_bid << 0
            end
        end    
    end
end