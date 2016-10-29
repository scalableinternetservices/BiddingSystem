class SellersController < UsersController
    
    def index
        @products = Product.paginate(page: params[:page], per_page: 10)
        @products_under_bid = ProductsUnderBid.all
    end
    
    def bid
        @product_id = params[:product_id]
        render "start_bid"
    end
    
    def end_bid
        @products_under_bid = ProductsUnderBid.all
        @product_bid_id = params[:product_bid_id]
        render "stop_bid"
    end
    
    #TODO: Checking product_id generated by the seller or not
    def start_bid
        product_id = params[:products_under_bid][:product_id]
        minimum_bidding_price = params[:products_under_bid][:minimum_bidding_price]
        now = params[:products_under_bid][:now]
        # puts now.class
        # puts product_id.class
        
        if now == "true"
            #puts "i m here"
            bid_start_date = nil
            bid_start_time = nil
        else
            bid_start_date = params[:products_under_bid][:bid_start_date]
            bid_start_time = params[:products_under_bid][:bid_start_time]
        end
        
        bid_end_date = params[:products_under_bid][:bid_end_date]
        bid_end_time = params[:products_under_bid][:bid_end_time]
        
        #puts product_id, minimum_bidding_price, bid_start_date, bid_start_time, bid_end_date, bid_end_time

        has_bid_started = ProductsUnderBid.start_bid?(product_id, minimum_bidding_price, bid_start_date, bid_start_time, bid_end_date, bid_end_time)
        has_bid_started
        
        @products = Product.paginate(page: params[:page], per_page: 10)
        @products_under_bid = ProductsUnderBid.all
        render "/products/index"
        # @products_under_bid = ProductsUnderBid.new(products_under_bid_params)
    end
    
    def stop_bid
        product_bid_id = params[:products_under_bid][:product_bid_id]
        params[:products_under_bid][:product_bid_id]
        puts "--------------------------------seller's controller-------------------------------------"
        puts product_bid_id
        has_bid_stopped = ProductsUnderBid.stop_bid?(product_bid_id)
        has_bid_stopped
    
        @products = Product.paginate(page: params[:page], per_page: 10)
        @products_under_bid = ProductsUnderBid.all
        render "/products/index"
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_under_bid
      @products_under_bid = ProductsUnderBid.find(params[:product_bid_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_under_bid_params
      params.require(:products_under_bid).permit(:product_bid_id, :product_id, :minimum_bidding_price, :bid_status, :sell_status, :bid_start_date, :bid_start_time, :bid_end_date, :bid_end_time)
    end
end
