Rails.application.routes.draw do

  root 'providers#index'

  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'show', to: 'movies#index'

  get 'likes', to: 'movies#likes'

  get 'like_movies', to: 'movies#like_movies'

  get 'netflex', to: 'movies#netflex'
  get 'hulu', to: 'movies#hulu'

  resources :movies do
    resource :likes, only: [:create, :destroy]
  end
end