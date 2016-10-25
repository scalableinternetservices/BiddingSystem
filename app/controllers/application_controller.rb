class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  def index
    @latest_products = Product.where(product_id: Product.last(10).pluck(:product_id).sample(3))
  end
  
end
