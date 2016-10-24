class UsersController < ApplicationController
    def search_products_under_bids
        ProductsUnderBid.search_products_under_bid(name: "name")
    end
end
