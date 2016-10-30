class ApplicationController < ActionController::Base
  
  before_action :random_latest_products
  protect_from_forgery with: :exception
  
  def initialize
    super
    @locations = ["", "Alabama", "Alaska", "Arizona", "Arkansas", 
                    "California", "Colorado", "Connecticut", "Delaware",
                    "District of Columbia", "Florida", "Georgia", "Hawaii",
                    "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
                    "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
                    "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska",
                    "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York",
                    "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
                    "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
                    "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
                    "West Virginia", "Wisconsin", "Wyoming"]
  end
  
  def random_latest_products
    @latest_products = Product.where(product_id: Product.last(10).pluck(:product_id).sample(3))
  end
  
end
