Rails.application.routes.draw do
  
  # Application root
  root 'application#index'
  
  devise_for :users
  
  resources :products, param: :product_id do
    collection do
      get 'my_products'
      get 'bids'
    end
    member do
      post 'back'
    end
  end
  
  resources :sellers do
    collection do
      get 'bid'
      get 'sold'
      post 'start_bid'
      get 'stop_bid'
      get 'show_bids'
    end
  end
  
  resources :buyers do
    collection do
      get 'search'
      get 'bought'
      post 'search_products'
      get 'ongoing_auctions'
      get 'my_bids'
      get 'place_new_bid'
      post 'place_bid'
      get 'revoke_bid'
    end
  end
  
  resources :categories, param: :category_id do
    member do 
        post 'back'
    end
  end
  
  get 'bids/:bid_id', to: 'bids#show'
  post '/bids/:bid_id', to: 'bids#show'
  get 'users/searchproductsunderbid', to: 'users#search_products_under_bid', as: :search_products
  get 'buyers/productsunderbid', to: 'buyers#get_products_under_bid'
  
  resources :bids, param: :bid_id
  resources :products_under_bids, param: :product_bid_id
  
end
