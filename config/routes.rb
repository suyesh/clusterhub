Rails.application.routes.draw do
  namespace :supplier do
  get 'contacts/index'
  end

  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  namespace :trucking do
    root to: 'dashboard#index', as: 'dashboard'
  end

  namespace :supplier do
    root to: 'dashboard#index', as: 'dashboard'
    resources :retailers
  end

  namespace :retailer do
    root to: 'dashboard#index', as: 'dashboard'
    resources :stations
    resources :tanks
  end

  namespace :admin do
    root to: 'dashboard#index', as: 'dashboard'
    resources :retailers
    resources :suppliers
    resources :truckings
    resources :users, only: [:index]
    resources :stations do
      resources :tanks
    end
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
