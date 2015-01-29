Rails.application.routes.draw do
  
  root to: 'users#index'
  
  get 'user/show', to: "users#show"
  
  get 'sessions/new'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  resources :users, except: [:new]

  resources :sessions, only: [:create, :delete]

  resources :friendships

  resources :activities
end
