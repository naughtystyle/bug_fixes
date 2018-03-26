Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :comments, only: [:create]
  resources :topics, only: [:show, :new, :create]
end
