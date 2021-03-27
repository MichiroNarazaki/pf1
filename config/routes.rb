Rails.application.routes.draw do
  # api----------------------
  namespace :api do
    namespace :v1 do
    end
  end
  # api----------------------
  root 'static_pages#home'
  # Header
  get '/create_micropost', to: 'static_pages#create_micropost'
  # Footer
  get '/ranking', to: 'static_pages#ranking'
  get '/search', to: 'microposts#search'
  resources :users
  # Others
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :microposts, only: %i[create destroy index] do
    resources :likes, only: %i[create destroy]
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/guest', to: 'guest_sessions#create'
end
