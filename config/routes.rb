Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users
end
