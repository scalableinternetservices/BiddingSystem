class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end
  
  def place_bid
    
    product_id = params[:bid][:product_id]
    user_id = params[:bid][:user_id]
    bid_amount = params[:bid][:bid_amount]
      
    bid_placed = Bid.place_bid?(product_id, user_id, bid_amount)
    
    if bid_placed
      respond_to do |format|
        format.html { redirect_to bid_url, notice: 'Bid was successfully placed.' }
        format.json { render :show, status: :created }
      end
    end
  end
    
  def revoke_bid
    
    product_id = params[:bid][:product_id]
    user_id = params[:bid][:user_id]
      
    bid_revoked = Bid.revoke_bid?(product_id, user_id)
    
    if bid_revoked
      respond_to do |format|
        format.html { redirect_to bid_url, notice: 'Bid was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
  end
    
  def get_all_the_bids
    
    product_id = params[:bid][:product_id]
    @bids = Bid.get_all_the_bids(product_id)
    
    respond_to do |format|
      format.html { redirect_to @bids, notice: 'Products under bid was successfully created.' }
      format.json { render json: @bids }
    end
    
  end
    
  def get_bids_by_user
    
    user_id = params[:bid][:user_id]
    @bidslist = Bid.get_bids_for_user(user_id)
    
    respond_to do |format|
      format.html { redirect_to @bidslist, notice: 'Products under bid was successfully created.' }
      format.json { render json: @bidslist }
    end
    
  end

  def show
    @bid = Bid.find(params[:bid_id])
  end
    
  private
    
    def bid_params
      params.require(:bid).permit(:product_id, :user_id, :bid_amount, :bidding_date, :bidding_time)
    end
    def set_bid
      @bid = Bid.find(params[:bid_id])
    end
end