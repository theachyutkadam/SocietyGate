# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq/cron/web"
Rails.application.routes.draw do
  namespace :api do
    resources :commitee_members
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
    resources :tenant_histories
    resources :flats
    resources :floors
    resources :wings
    resources :buildings
    resources :user_informations
    resources :users
    resources :societies
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
