Rails.application.routes.draw do

  get 'buyer/place_bid'

  get 'buyer/revoke_bid'

  get 'buyer/get_highest_bid'

  get 'buyer/get_all_bids'

  get 'buyer/get_bids_by_user'

  get 'buyer_controller/place_bid'

  get 'buyer_controller/revoke_bid'

  get 'buyer_controller/get_highest_bid'

  get 'buyer_controller/get_all_bids'

  get 'buyer_controller/get_bids_by_user'

  resources :bids
  get 'place_bid/home'

  get 'place_bid/bid'

  get 'home/home'


  resources :products, param: :product_id
  
  # Application root
  root 'application#index'

end
