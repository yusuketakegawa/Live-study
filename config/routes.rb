Rails.application.routes.draw do
  root "studies#index"
  resources :studies, only: [:show]
end
