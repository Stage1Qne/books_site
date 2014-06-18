Rails.application.routes.draw do
  root 'books#index'
  resources :comments

  devise_for :admins, path: '/admin'
  resources :authors
  resources :books


  namespace :admin do
    root 'dashboard#index'
    resources :admins
    resources :authors
    resources :books
    resources :comments

  end
end
