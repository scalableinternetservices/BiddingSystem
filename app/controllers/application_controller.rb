class ApplicationController < ActionController::Base
  
  before_filter :random_latest_products
  protect_from_forgery with: :exception
  
  def random_latest_products
    @latest_products = Product.where(product_id: Product.last(10).pluck(:product_id).sample(3))
  end
  
end
