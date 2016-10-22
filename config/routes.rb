Rails.application.routes.draw do

  resources :bids, param: :bid_id do
    member do
      post 'place_bid'
    end
  end
  resources :categories, param: :category_id
  resources :products, param: :product_id

  post '/bids/:bid_id', to: 'bids#show'

  
  # Application root
  root 'application#index'

end
