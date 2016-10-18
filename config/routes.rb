Rails.application.routes.draw do
  resources :bids
  get 'place_bid/home'

  get 'place_bid/bid'

  get 'home/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
end
