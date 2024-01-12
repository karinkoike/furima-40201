Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :new, :create, :show, :destroy]
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
end
