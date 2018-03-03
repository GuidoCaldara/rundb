Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/exchange_token", to: "application#strava"

  resources :races do
    resources :reviews, only: [:create]
    resources :orders, except: [:edit, :update]
    resources :favorites, only: [:create]
    resources :photos, only: [:new, :create, :destroy]
    resources :routes, only: [:new, :create, :destroy]
  end
  resources :favorites, only: [:destroy]
  resources :reviews, only: [:destroy, :edit, :update]
  resources :organisations, except: [:index]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  get '/races/:race_id/photos/manage', to: 'photos#manage', as: "manage_photo"



end

