Rails.application.routes.draw do

  get '/about', to: "sites#about"

  get '/contact', to: "sites#contact"

	root to: "sites#index"
  
  get 'sessions/new'

  get 'users/index'

 get 'sessions/new'
  
  get 'users/show'

  # get 'users/new'

  # get 'users/edit'

  resources :users, except: [:new]

  resources :sessions, only: [:create, :delete]
  
  get "/twitter/connect", to: "sessions#twitter_connect"

  get "/oauth/callback", to: "sessions#twitter_callback"
end
