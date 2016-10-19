Rails.application.routes.draw do
  resources :products_under_bids, param: :product_bid_id
  get 'home/home'
  get 'buyer/productsunderbid', to: 'buyer#get_products_under_bid'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
end
