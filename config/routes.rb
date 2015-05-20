Rails.application.routes.draw do
  root "rooms#new"
  resources :rooms, only: [:new, :create, :show]
  resources :rounds, only: [:edit, :update]
end
