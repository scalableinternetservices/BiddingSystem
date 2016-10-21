Rails.application.routes.draw do
  resources :products_under_bids, param: :product_bid_id
  resources :sellers do
    collection do
      post 'start_bid'
    end
  end
  
  resources :sellers do
    collection do
      post 'stop_bid'
    end
  end
  
  get 'home/home'
  get 'buyers/productsunderbid', to: 'buyers#get_products_under_bid'
  #post 'seller/start_bid', to: 'seller#start_bid'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
end
