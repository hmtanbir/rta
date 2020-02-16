Rails.application.routes.draw do
  root to: 'home#index'
  resources :profiles
  resources :users
  resources :ages
  resources :countries
  resources :months
  resources :years
  resources :diseases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
