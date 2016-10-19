Rails.application.routes.draw do

  resources :categories, param: :category_id
  resources :products, param: :product_id
  
  # Application root
  root 'application#index'

end
