Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'


  resources :articles

  get 'signup', to: 'users#new'
  resource :users, except: [:new]

  # POST, DELETE, SELECT, PUT, UPDATE ir etc. articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
