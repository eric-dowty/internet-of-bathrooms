Rails.application.routes.draw do

  resources :bathrooms, only: [:index]

  get    '/auth/:provider/callback', to: 'sessions#create'
  get    '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#login'

end
