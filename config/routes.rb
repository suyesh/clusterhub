Rails.application.routes.draw do
  root to: 'pages#home'

  get 'about' =>"pages#about"
  get 'what-we-do' =>"pages#what_we_do"
  get 'contact'=>"pages#contact"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

end
