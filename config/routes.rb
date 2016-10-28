Rails.application.routes.draw do
  
  # Application root
  root 'application#index'
  
  resources :bids, param: :bid_id
  resources :categories, param: :category_id
  resources :products, param: :product_id
  resources :products_under_bids, param: :product_bid_id
  
  resources :sellers do
    collection do
      get 'bid'
      get 'end_bid'
      post 'start_bid'
      post 'stop_bid'
    end
  end
  
  resources :buyers do
    collection do
      get 'search'
      post 'search_product'
    end
  end
  
  resources :products do
    member do 
        post 'back'
    end
  end
  
  resources :categories do
    member do 
        post 'back'
    end
  end
  
  
  get 'users/searchproductsunderbid', to: 'users#search_products_under_bid', as: :search_products
  
  get 'buyers/productsunderbid', to: 'buyers#get_products_under_bid'
  
end
