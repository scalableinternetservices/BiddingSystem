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
    end
    
    def search_products
        search_name = params[:search][:name]
        search_category = params[:search][:category_id].to_i
        search_location = params[:search][:location]
        search_highest_bid = params[:search][:highest_bid].to_f
        @matching_products = ProductsUnderBid.search_products_under_bid(name: search_name, category_id: search_category, 
                                                                        location: search_location, highest_bid: search_highest_bid)
    end
    
    def ongoing_auctions
        @products_under_bid = ProductsUnderBid.get_products_under_bid
    end

end