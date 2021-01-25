Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  get "session/new"
  get "foo/bar"
  get "foo/baz"
  get "microposts/index",to:"microposts#index"
  root "static_pages#home"
  get "/ranking", to: "static_pages#ranking"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  resources :microposts, only: [:create, :destroy, :index] do
    resources :likes, only: [:create,:destroy]
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup", to: "users#new"
  get "/create_micropost", to: "static_pages#create_micropost"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/guest", to: "guest_sessions#create"
end
