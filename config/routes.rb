Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "studies#index"
  resources :studies, except: [:index] do
    member do
      delete 'finish'
    end
    collection do
      get 'search'
    end
    resources :joins, only: %i[new create destroy]
    resources :comments, only: :create
  end

  resources :users, only: %i[show edit update] do
    member do
      get 'mypage'
    end
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :messages, only: [:create]
  resources :rooms, only: %i[index create show]
  resources :notifications, only: [:index]

  match "*path" => "application#error404", via: :all
end
