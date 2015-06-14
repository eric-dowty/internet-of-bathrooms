Rails.application.routes.draw do

  resources :bathrooms, only: [:index]

  get    '/auth/:provider/callback', to: 'sessions#create'
  get                      '/login', to: 'sessions#new'
  delete                  '/logout', to: 'sessions#destroy'

  root 'sessions#new'

end
