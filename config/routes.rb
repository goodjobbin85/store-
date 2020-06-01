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

  get '/login', to: "session#create", as: "login"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/signup', to: "users#new", as: "signup"
end
