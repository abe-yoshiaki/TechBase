Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  resources :tweets
  resources :users
end
