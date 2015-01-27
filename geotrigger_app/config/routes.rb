Rails.application.routes.draw do

  get 'sites/index'

  get 'sites/about'

  get 'sites/contact'

	root to: "sites#index"
  
  # get 'sessions/new'

  # get 'users/index'

  # get 'users/show'

  # get 'users/new'

  # get 'users/edit'

  resources :users, except: [:index, :new]

  resources :sessions, only: [:create, :delete]
  
end
