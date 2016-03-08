Rails.application.routes.draw do
  root 'pages#home'

  get 'about' =>"pages#about"
  get 'what-we-do' =>"pages#what_we_do"
  get 'contact'=>"pages#contact"

end
