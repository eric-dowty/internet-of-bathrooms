Rails.application.routes.draw do

  get    '/auth/:provider/callback', to: 'sessions#create'
  delete                  '/logout', to: 'sessions#destroy'

  get                      '/login', to: 'bathrooms#home'
  get                     '/status', to: 'bathrooms#status'
  get                     '/trivia', to: 'bathrooms#trivia'
  get                  '/bathrooms', to: 'bathrooms#main'
  
  get                       '*path', :to => 'errors#show'

  root 'bathrooms#home'

end
