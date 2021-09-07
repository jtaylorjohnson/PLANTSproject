Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :plants do
    resources :comments, only: [:new]
  resources :users do
    resources :plants, only: [:index]
  resources :comments
  resources :user_plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
