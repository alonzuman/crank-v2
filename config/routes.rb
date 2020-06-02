Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#discover'
  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes
  end
  
  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  get '/feed', to:'posts#feed', as: 'feed'
  get '/users/:id/follow', to: 'users#follow', as: 'follow'
  get '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  resources :comments, only: [:destroy]
  resources :users, only: [:show]
end

