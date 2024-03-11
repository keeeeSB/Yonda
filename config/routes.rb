Rails.application.routes.draw do
  root   "static_pages#top"
  get    "/home",   to: "static_pages#home"
  get    "/about",  to: "static_pages#about"
  get    "signup",  to: "users#new"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :families
  resources :children
  resources :books do
    collection { get :search }
  end
end
