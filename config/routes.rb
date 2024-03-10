Rails.application.routes.draw do
  resources :accounts
  resources :users
  resources :facilities
  resources :customers
  resources :venues do
    resources :bookings
    get 'available_slots', on: :member
  end
  resources :venue_types
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
