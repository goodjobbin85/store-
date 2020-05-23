Rails.application.routes.draw do
  resources :shops do
    resources :items
  end
  
  resources :items
  resources :users

  resources :shops
end
