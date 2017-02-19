Rails.application.routes.draw do
  resources :charges, except: [:edit]
  root 'charges#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
