Rails.application.routes.draw do
  # Configuração do Devise
  devise_for :users
  
  # Página inicial pública
  root 'home#index'
  
  # Rotas públicas
  resources :properties, only: [:index, :show]
  resources :neighborhoods, only: [:show]
  
  # Área administrativa
  namespace :admin do
    # Dashboard como página inicial do admin
    root 'dashboard#index'
    
    # Recursos administrativos
    resources :users, only: [:index, :show]
    resources :neighborhoods do
      member do
        patch :toggle_active
      end
    end
    
    resources :properties do
      # Rota para remoção de imagens
      resources :images, only: [:destroy], module: :properties
      
      member do
        patch :toggle_featured
      end
    end
  end
end

# Rails.application.routes.draw do
#   devise_for :users
#   root 'home#index'
  
#   resources :properties, only: [:index, :show]
#   resources :neighborhoods, only: [:show]
  
#   namespace :admin do
#     root 'dashboard#index'
#     resources :users
#     resources :neighborhoods
#     resources :properties do
#       resources :images, only: [:destroy], module: :properties
#     end
#   end
# end