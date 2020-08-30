Rails.application.routes.draw do
  root "studies#index"
  resources :studies, only: [:show]
  resources :profiles, only: [:show]
  resources :rooms, only: [:show]
end
