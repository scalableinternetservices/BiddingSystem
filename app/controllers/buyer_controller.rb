class BuyerController < ApplicationController
    
    def get_products_under_bid
        @products_under_bid = ProductsUnderBid.get_products_under_bid
        
        respond_to do |format|
            format.html { redirect_to @products_under_bid, notice: 'Products under bid was successfully created.' }
            format.json { render json: @products_under_bid }
        end
    end
    
end
