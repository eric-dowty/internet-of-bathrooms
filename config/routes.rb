Rails.application.routes.draw do

  resources :bathrooms, only: [:index]

  get      '/login', to: 'sessions#new'
  delete  '/logout', to: 'sessions#destroy'

  root 'bathrooms#index'
  
end
