Rails.application.routes.draw do

  get    '/auth/:provider/callback', to: 'sessions#create'
  delete                  '/logout', to: 'sessions#destroy'

  get                      '/login', to: 'bathrooms#home'
  get                     '/status', to: 'bathrooms#status'
  get                    '/updates', to: 'bathrooms#updates'
  get                  '/bathrooms', to: 'bathrooms#main'

  get                     '/trivia', to: 'trivia#data'
  get                     '/answer', to: 'trivia#answer'   

  get                        '/bot', to: 'users#get_bot_data'
  get                 '/bot_update', to: 'users#update_bot_data'

  get                      '/score', to: 'scores#show'
  
  get                       '*path', :to => 'errors#show'

  root 'bathrooms#home'

end
