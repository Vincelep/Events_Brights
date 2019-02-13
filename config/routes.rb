Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resources :attendances, only: [:new, :create]
  end
  resources :users
  root 'events#index'
end
