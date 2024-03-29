Rails.application.routes.draw do
  root "rooms#new"
  resources :rooms, only: [:new, :create, :show] do
    resources :rounds, only: [:create]
  end
  resources :rounds, only: [:edit, :update] do
    resources :guesses, only: [:create]
  end
end
