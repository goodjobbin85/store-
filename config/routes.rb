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
end
