Rails.application.routes.draw do
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
