Rails.application.routes.draw do
  get 'family_invitations/new'
  root   "static_pages#top"
  get    "/home",       to: "read_records#index"
  get    "/about",      to: "static_pages#about"
  get    "/privacy",    to: "static_pages#privacy"
  get    "/terms",      to: "static_pages#terms"
  get    "signup",      to: "users#new"
  get    "/login",      to: "sessions#new"
  post   "/login",      to: "sessions#create"
  delete "/logout",     to: "sessions#destroy"
  post   "guest_login", to: "guest_sessions#create"
  resources :users
  resources :families
  resources :children
  resources :books do
    collection { get :search }
  end
  resources :read_records do
    resources :favorites, only: %i[create destroy]
  end
  resources :contacts, only: %i[new create]
  resources :account_activations, only: %i[edit]
  resources :password_resets, only: %i[new create edit update]
  resources :invitations, only: %i[new create]
  resources :family_invitations, only: %i[new create]
end
