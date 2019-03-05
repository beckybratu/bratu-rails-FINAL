Rails.application.routes.draw do
  get 'venues/new'
  get 'venues/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback', to: 'sessions#create_from_omniauth'


  root to: 'concerts#index'

  resources :venues

  get '/concerts', to: redirect('/'), as: "concerts"

  post '/concerts', to: 'concerts#create'

  resources :users

  resources :concerts


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


end
