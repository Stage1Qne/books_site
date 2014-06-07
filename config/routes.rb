Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :admins, controllers: {sessions: 'admin/sessions'}, path: '/admin'
  resources :authors
  resources :books


  namespace :admin do
    root 'dashboard#index'
    resources :admins
    resources :authors
    resources :books

  end
end
