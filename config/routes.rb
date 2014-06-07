Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :admins, controllers: {sessions: 'admin/sessions'}, path: '/admin'

  namespace :admin do
    root 'dashboard#index'
    resources :admins
  end
end
