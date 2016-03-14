Rails.application.routes.draw do
  namespace :trucking do
    get 'application/index', as: 'dashboard'
  end

  namespace :supplier do
    get 'application/index', as: 'dashboard'
  end

  namespace :retailer do
    root 'application#index', as: 'dashboard'
    resources :stations, only: [:new, :create, :edit, :update] do
      resources :tanks
    end
  end

  namespace :admin do
    get 'application/index', as: 'dashboard'
    resources :stations
    resources :users
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
