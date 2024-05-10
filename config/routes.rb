Rails.application.routes.draw do
  root   "static_pages#top"
  get    "/home",       to: "read_records#index"
  get    "/about",      to: "static_pages#about"
  get    "/privacy",    to: "static_pages#privacy"
  get    "/terms",      to: "static_pages#terms"
  get    "signup",      to: "users#new"
  get    "/login",      to: "sessions#new"
  post   "/login",      to: "sessions#create"
  delete "/logout",     to: "sessions#destroy"
  resources :users
  resources :families
  resources :children
  resources :books do
    collection { get :search }
  end
  resources :read_records
  resources :contacts, only: %i[new create]
  resources :account_activations, only: %i[edit]
  resources :password_resets, only: %i[new create edit update]
end
