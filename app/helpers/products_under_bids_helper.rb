module ProductsUnderBidsHelper
    def cache_key_for_my_bids_table(products)
        "my_bids_table/#{current_user.id}/#{products.maximum(:updated_at)}/#{products.count}"
    end
end
