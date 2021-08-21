Rails.application.routes.draw do
  devise_for :users
  root to: 'shop#index'

  resources :products
end
