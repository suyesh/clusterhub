Rails.application.routes.draw do




  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => "sessions#new", as: "login"



  namespace :trucking do
    root to: 'dashboard#index', as: 'dashboard'
  end

  namespace :supplier do
    root to: 'dashboard#index', as: 'dashboard'
  end

  namespace :retailer do
    root to: 'dashboard#index', as: 'dashboard'
    resources :stations
    resources :tanks
  end

  namespace :admin do
    root to: 'dashboard#index', as: 'dashboard'
    resources :stations do
      resources :tanks
    end
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
