Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
  resources :users, only: [:show]
end

