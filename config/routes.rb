Rails.application.routes.draw do
  root 'registers#index'

  get 'register', to: 'users#new', as: 'register'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :registers, except: :show  do
    resource :vote, module: :registers
  end

  resources :users
  resources :sessions
  resources :password_resets
end
