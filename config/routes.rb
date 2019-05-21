Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root 'tweets#home'
  resources :users
end
