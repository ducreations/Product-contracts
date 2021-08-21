Rails.application.routes.draw do
  devise_for :users
  root to: 'shop#index'

  resources :products do
    member do
      post :agree
    end
  end

  resources :contracts
end
