Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'parties#index'
  resources :parties
  resources :members
  namespace :oparation_member do
    resources :participates, only: [:update, :destroy]
    resources :roles, only: [:update]
  end
end
