Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :new, :create, :show, :destroy]
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create, :show]
  end
end
