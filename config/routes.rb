Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  devise_for :users
  
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update] 
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  

end
