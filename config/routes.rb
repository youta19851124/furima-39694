Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, onli: [:index, :new, :create]
end
