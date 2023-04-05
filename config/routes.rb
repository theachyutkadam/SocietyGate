Rails.application.routes.draw do
  resources :commities
  resources :events
  resources :complaints
  resources :family_members
  resources :gate_entries
  resources :documents
  resources :vehicles
  resources :parkings
  resources :amenities
  resources :addresses
  resources :tenent_histories
  resources :flats
  resources :floors
  resources :wings
  resources :sectors
  resources :user_informations
  resources :users
  resources :societies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
