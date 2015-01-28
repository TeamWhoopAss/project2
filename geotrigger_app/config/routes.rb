Rails.application.routes.draw do

  get '/about', to: "sites#about"

  get '/contact', to: "sites#contact"

	root to: "sites#index"
  
  # get 'sessions/new'

  # get 'users/index'

  # get 'users/show'

  # get 'users/new'

  # get 'users/edit'

  resources :users, except: [:index, :new]

  resources :sessions, only: [:create, :delete]
  
end
