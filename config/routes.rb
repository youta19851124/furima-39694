Rails.application.routes.draw do
  root to: 'items#index'
  resources :items, onli: :index
end
