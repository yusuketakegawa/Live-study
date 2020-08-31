Rails.application.routes.draw do
  devise_for :users
  root "studies#index"
  resources :studies, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:show]
end
