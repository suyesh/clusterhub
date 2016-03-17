Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => "sessions#new", as: "login"



  namespace :trucking do
    root to: 'application#index', as: 'dashboard'
  end

  namespace :supplier do
    root to: 'application#index', as: 'dashboard'
  end

  namespace :retailer do
    root to: 'application#index', as: 'dashboard'
    resources :stations, only: [:new, :create, :edit, :update] do
      resources :tanks
    end
  end

  namespace :admin do
    root to: 'application#index', as: 'dashboard'
    resources :stations do
      resources :tanks
    end
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
