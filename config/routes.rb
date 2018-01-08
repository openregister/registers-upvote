Rails.application.routes.draw do
  root 'welcome#home'

  resources :registers, except: :show  do
    member do
      post 'upvote'
    end
  end
end
