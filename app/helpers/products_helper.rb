module ProductsHelper
    def cache_key_for_products(product)
        "product/#{product.product_id}/#{product.updated_at}"
    end
    
    def cache_key_for_products_show(product)
        "product_show/#{product.product_id}/#{product.updated_at}"
    end
    
    def cache_key_for_my_bids(product)
        "my_bid/#{product.product_id}/#{product.updated_at}/#{product.maximum_bidding_price}"
    end
    
    def cache_key_for_products_table(products)
        "my_products_table/#{current_user.id}/#{products.maximum(:updated_at)}/#{products.count}"
    end
end
