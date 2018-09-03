Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :sessions, only: :create
  resources :users, only: :index
  resources :metrics, only: :index
  resources :restaurants, only: :index
end
