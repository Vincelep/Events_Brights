Rails.application.routes.draw do
  devise_for :users

  resources :events
  resources :attendances
  resources :users
  resources :charges, only: [:new, :create]
  root 'events#index'
end
