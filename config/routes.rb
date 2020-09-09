Rails.application.routes.draw do
  devise_for :users
  root "studies#index"
  resources :studies do
    member do
      delete 'finish'
    end
    resources :joins
    resources :comments, only: :create
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:index, :create,:show]
  resources :notifications, only: [:index]
end
