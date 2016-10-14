Rails.application.routes.draw do

  resources :products
  
  # Application root
  root 'home#home'
  
  get 'home/home'

end
