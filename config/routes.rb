Rails.application.routes.draw do
  devise_for :users
  root "studies#index"
  resources :studies do
    resources :joins
  end
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:show]
end
