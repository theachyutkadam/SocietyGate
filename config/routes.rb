# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq/cron/web"
Rails.application.routes.draw do
  get :health, controller: "application"

  namespace :api do
    mount Motor::Admin => "/motor_admin"
    mount Sidekiq::Web => "/admin/sidekiq"

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
    resources :societies

    resources :users do
      get "onboarding", on: :collection
      get "logout", on: :collection
      post "login", on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#health"
end
