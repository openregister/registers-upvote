Rails.application.routes.draw do
  root 'welcome#home'

  get 'register', to: 'users#new', as: 'register'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :registers, except: :show  do
    member do
      post 'upvote'
    end
  end

  resources :users
  resources :sessions
  resources :password_resets
end
