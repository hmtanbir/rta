# frozen_string_literal: true

# routes
Rails.application.routes.draw do
  root to: 'search#index'
  get 'search', to: 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
