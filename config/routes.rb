Rails.application.routes.draw do

  resources :bids
  get 'place_bid/home'

  get 'place_bid/bid'

  get 'home/home'


  resources :products, param: :product_id
  
  # Application root
  root 'application#index'

end
