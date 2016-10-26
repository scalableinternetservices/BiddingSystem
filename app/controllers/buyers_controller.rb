class BuyersController < UsersController
    
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

    def search
        render "search"
    end
    
    def search_product
        search_name = params[:search][:name]
        search_category = params[:search][:category_id].to_i
        search_location = params[:search][:location]
        search_highest_bid = params[:search][:highest_bid].to_f
        matching_products = ProductsUnderBid.search_products_under_bid(search_name, search_category, search_highest_bid)
        puts "Matching products", matching_products.map { |c| c.name }
        puts "Search params: ", search_name, search_category, search_location, search_highest_bid
    end
    
    def get_products_under_bid
        @products_under_bid = ProductsUnderBid.get_products_under_bid
        
        respond_to do |format|
            format.html { redirect_to @products_under_bid, notice: 'Products under bid was successfully created.' }
            format.json { render json: @products_under_bid }
        end
    end

end