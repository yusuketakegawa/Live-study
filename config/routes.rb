Rails.application.routes.draw do
  devise_for :users
  root "studies#index"
  resources :studies
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:show]
end
