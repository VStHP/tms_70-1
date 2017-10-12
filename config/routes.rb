Rails.application.routes.draw do

  root "static_pages#home"

  get "/help", to: "static_pages#help"

  get "/about", to: "static_pages#about"

  get "/contact", to: "static_pages#contact"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:create, :destroy, :new]

  namespace :suppervisor do
    resources :users
  end

  resources :courses, only: %i(index)
end
