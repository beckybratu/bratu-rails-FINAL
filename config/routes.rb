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

  resources :bands do
   resources :concerts
  end

  resources :users, only: [:new, :create, :show] do
    resources :venues, only: [:index]
  end

  resources :sessions, only: [:new, :create, :destroy]

end
