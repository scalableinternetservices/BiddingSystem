class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def my_products
    @products = Product.select("products.product_id, category_id, name, date_added, location_id, product_bid_id, sell_status").where(:user_id => current_user.id).paginate(page: params[:page], per_page: 10).joins('LEFT OUTER JOIN products_under_bids ON products.product_id = products_under_bids.product_id')
    expires_in 30.minutes, :public => true
  end
  

  def show
  end
  
  def back
    redirect_to products_url
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.date_added = Date.today

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product][:user_id] = current_user.id
      params.require(:product).permit(:user_id, :category_id, :name, :date_added, :location_id, :image)
    end

end