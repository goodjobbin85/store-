Rails.application.routes.draw do
  root to: 'static#home'

  get 'static/home'
  resources :shops do
    resources :items
  end

  resources :items
  resources :users

  resources :shops
  resources :categories

  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/signup', to: "users#new", as: "signup"
end
