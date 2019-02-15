Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resources :attendances, only: [:new, :create, :index]
    resources :avatars, only: [:create]
  end
  resources :users
  root 'events#index'
end
