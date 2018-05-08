Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/how-to-shape'

  resources :confirmations, only: [:show]
end
