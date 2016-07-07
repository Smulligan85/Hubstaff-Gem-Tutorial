Rails.application.routes.draw do
  root "welcome#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'users/:id/hubstaff', to: 'users#client', as: 'client'
  post '/auth_client', to: 'users#auth_client'
  post '/custom_report', to: 'users#custom_report', as: 'custom_report'

  resources :users
  resources :sessions
end
