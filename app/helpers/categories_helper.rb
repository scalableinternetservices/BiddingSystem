module CategoriesHelper
    def cache_key_for_categories(category)
        "category/#{category.category_id}/#{category.updated_at}"
    end
    
    def cache_key_for_categories_show(category)
        "category_show/#{category.category_id}/#{category.updated_at}"
    end
end
