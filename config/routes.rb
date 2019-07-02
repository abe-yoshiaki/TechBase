Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root 'tweets#home'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users
end
