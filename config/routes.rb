Rails.application.routes.draw do

  resources :categories, param: :category_id
  resources :bids, param: :bid_id
  resources :products, param: :product_id
  
  get 'place_bid/home'

  get 'place_bid/bid'

  get 'home/home'


  
  
  # Application root
  root 'application#index'

end
