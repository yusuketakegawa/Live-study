Rails.application.routes.draw do
  devise_for :users
  root "studies#index"
  resources :rooms, only: [:show]
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
end
