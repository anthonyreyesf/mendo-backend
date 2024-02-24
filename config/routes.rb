Rails.application.routes.draw do
  resources :accounts
  resources :users
  resources :facilities
  resources :customers
  resources :venues
  resources :venue_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
