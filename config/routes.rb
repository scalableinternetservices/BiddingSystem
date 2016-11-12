Rails.application.routes.draw do
  
  # Application root
  root 'application#index'
  
  devise_for :users
  
  resources :products do
    collection do
      get 'my_products'
    end
    member do
      post 'back'
    end
  end
  
  resources :sellers do
    collection do
      get 'bid'
      post 'start_bid'
      get 'stop_bid'
    end
  end
  
  resources :buyers do
    collection do
      get 'search'
      post 'search_products'
      get 'ongoing_auctions'
      get 'place_new_bid'
      post 'place_bid'
      get 'revoke_bid'
    end
  end
  
  resources :categories do
    member do 
        post 'back'
    end
  end
  
  get 'bids/:bid_id', to: 'bids#show'
  post '/bids/:bid_id', to: 'bids#show'
  get 'users/searchproductsunderbid', to: 'users#search_products_under_bid', as: :search_products
  get 'buyers/productsunderbid', to: 'buyers#get_products_under_bid'
  
  resources :bids, param: :bid_id
  resources :categories, param: :category_id
  resources :products, param: :product_id
  resources :products_under_bids, param: :product_bid_id
  
end
