Rails.application.routes.draw do

  resources :bids
  resources :categories, param: :category_id
  resources :products, param: :product_id
  resources :bids, param: :bid_id
  # Application root
  root 'application#index'

end
