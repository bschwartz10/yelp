Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :users, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :restaurants, only: [:create]
end
