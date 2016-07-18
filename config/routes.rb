Rails.application.routes.draw do
  
  get 'static_pages/index'

  resources :services

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '*tail' => "static_pages#index"
end
