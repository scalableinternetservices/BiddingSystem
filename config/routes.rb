Rails.application.routes.draw do

  resources :products, param: :product_id
  
  # Application root
  root 'home#home'
  
  get 'home/home'

end
