class ProductsUnderBidsController < ApplicationController
  before_action :set_products_under_bid, only: [:show, :edit, :update, :destroy]

  # GET /products_under_bids
  # GET /products_under_bids.json
  def index
    @products_under_bids = ProductsUnderBid.all
  end

  # GET /products_under_bids/1
  # GET /products_under_bids/1.json
  def show
  end

  # GET /products_under_bids/new
  def new
    @products_under_bid = ProductsUnderBid.new
  end

  # GET /products_under_bids/1/edit
  def edit
  end

  # POST /products_under_bids
  # POST /products_under_bids.json
  def create
    @products_under_bid = ProductsUnderBid.new(products_under_bid_params)

    respond_to do |format|
      if @products_under_bid.save
        format.html { redirect_to @products_under_bid, notice: 'Products under bid was successfully created.' }
        format.json { render :show, status: :created, location: @products_under_bid }
      else
        format.html { render :new }
        format.json { render json: @products_under_bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_under_bids/1
  # PATCH/PUT /products_under_bids/1.json
  def update
    respond_to do |format|
      if @products_under_bid.update(products_under_bid_params)
        format.html { redirect_to @products_under_bid, notice: 'Products under bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_under_bid }
      else
        format.html { render :edit }
        format.json { render json: @products_under_bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_under_bids/1
  # DELETE /products_under_bids/1.json
  def destroy
    @products_under_bid.destroy
    respond_to do |format|
      format.html { redirect_to products_under_bids_url, notice: 'Products under bid was successfully destroyed.' }
      format.json { head :no_content }
    end
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
