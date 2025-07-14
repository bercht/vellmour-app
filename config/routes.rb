Rails.application.routes.draw do
  devise_for :users
  root 'properties#index'
  
  resources :properties, only: [:index, :show]
  resources :neighborhoods, only: [:show]
  
  namespace :admin do
    root 'dashboard#index'
    resources :users
    resources :neighborhoods
    resources :properties
  end
end