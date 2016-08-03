Rails.application.routes.draw do

  root to: 'news#index'
  
  get 'static_pages/index'

  resources :services
  resources :news

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '*tail' => "static_pages#index"
end
