Rails.application.routes.draw do

  root to: "sites#index"

  get '/about', to: "sites#about"

  get '/contact', to: "sites#contact"
  
  # root to: 'users#index'
  
  get 'users/show', to: "users#show"
  
  get 'sessions/new'

  get 'users/index'

  get 'sessions/new'
  
  get 'users/next_steps'


  get '/sign_up', to: "users#new"

  get '/login', to: "sessions#new"
  # get 'users/new'

  get 'sign_up', to: 'users#new'
  get 'login', to: 'sessions#new'


  # get 'users/edit'

  resources :users

  resources :sessions, only: [:create, :delete]

  resources :friendships

  resources :activities
  
  # get "/twitter/connect", to: "sessions#twitter_connect"

  # get "/oauth/callback", to: "sessions#twitter_callback"
end
