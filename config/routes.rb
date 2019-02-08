Rails.application.routes.draw do
  get 'venues/new'
  get 'venues/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'concerts#index'

  resources :venues

  resources :concerts, only: [:new, :create, :edit, :update, :destroy, :index]

  resources :users, only: [:show] do
    resources :concerts, only: [:show]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


end
