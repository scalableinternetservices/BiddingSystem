json.array!(@products) do |product|
  json.extract! product, :id, :bid_id, :added_by_user_id, :category_id, :name, :date_added, :location
  json.url product_url(product, format: :json)
end
