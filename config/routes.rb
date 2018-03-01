Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :races do
    resources :reviews, only: [:create]
    resources :orders
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:destroy]
  resources :reviews, only: [:destroy, :edit, :update]
  resources :organisations, except: [:index]


end
