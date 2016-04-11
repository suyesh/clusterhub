Rails.application.routes.draw do




  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  namespace :trucking do
    root to: 'dashboard#index', as: 'dashboard'
  end

  namespace :supplier do
    root to: 'dashboard#index', as: 'dashboard'
    get 'pricerocket_history' => 'text_history#index'
    resources :retailers
    resources :fuel_prices
    resources :contacts
    get 'mass_send/index'
    post 'mass_send/mass_send_texts'
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
    resources :users
    resources :stations do
      resources :tanks
    end
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
