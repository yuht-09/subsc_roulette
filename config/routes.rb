Rails.application.routes.draw do

  root 'providers#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'show', to: 'movies#index'

  resources :users
end