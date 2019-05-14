Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :books
  
  root 'home#index'
  # root 'category#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
