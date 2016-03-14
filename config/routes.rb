Myapp::Application.routes.draw do
  namespace :trucking do
  get 'application/index'
  end

  namespace :supplier do
    get 'application/index'
  end

  namespace :retailer do
    get 'application/index'
  end

  namespace :admin do
    get 'application/index'
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
