Rails.application.routes.draw do
  get 'venues/new'
  get 'venues/create'
  get 'bands/new'
  get 'bands/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#welcome'

  resources :venues

  resources :bands
  resources :concerts

  resources :users, only: [:new, :create, :show] do
    resources :venues, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


end
