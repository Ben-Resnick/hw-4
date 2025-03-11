Rails.application.routes.draw do
  root "places#index"
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
end
