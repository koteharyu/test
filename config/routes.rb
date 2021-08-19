Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parties do
    member do
      put :add_member
      delete :remove_member
    end
  end
  resources :members
end
