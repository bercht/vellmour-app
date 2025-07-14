Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :properties, only: [:index, :show]
  resources :neighborhoods, only: [:show]
  
  namespace :admin do
    root 'dashboard#index'
    resources :users
    resources :neighborhoods
    resources :properties do
      resources :images, only: [:destroy], module: :properties
    end
  end
end