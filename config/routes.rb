Rails.Application.routes.draw do
  namespace :trucking do
    get 'application/index'
  end

  namespace :supplier do
    get 'application/index'
  end

  namespace :retailer do
    root 'application#index'
    resources :stations, only: [:new, :create, :edit, :update] do
      resources :tanks
    end
  end

  namespace :admin do
    get 'application/index'
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
