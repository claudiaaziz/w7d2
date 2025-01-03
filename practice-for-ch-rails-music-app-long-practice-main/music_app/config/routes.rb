Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#new"
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
