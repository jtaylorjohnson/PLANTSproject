Rails.application.routes.draw do
  resources :plants
  resources :users
  resources :comments
  resources :user_plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end