Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'comments/index'
  resources :users
  resources :posts
  resources :comments
  
  get 'login', to: 'sessions#new'
  
  post 'login', to: 'sessions#create'
  
  get 'welcome', to: 'sessions#welcome'

  get 'authorised', to: 'sessions#page_requires_login'

  get 'logout', to: 'sessions#logout'

  post 'comments/new', to: 'comments#create'
end
