Rails.application.routes.draw do
  resources :bathrooms, only: [:index]

  root 'bathrooms#index'
end
