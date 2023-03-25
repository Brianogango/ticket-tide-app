Rails.application.routes.draw do
  # resources :events
  # resources :users, only: [:create, :show]
  post 'users', to: 'users#create'
   post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'users/:id', to: 'users#show'
  post 'events', to: 'events#create'
  get 'events', to: 'events#index'
  post 'payments', to: 'payments#create'

end
