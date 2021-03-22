Rails.application.routes.draw do
  get "sign_up", to: "users#sign_up"
  post "sign_up", to: "users#new_user"
  get "sign_in", to: "users#sign_in"
  post "sign_in", to: "users#new_session"
  delete "sign_out", to: "users#sign_out"
  resources :users, except: [:create, :index, :new]

  resources :articles, except: [:index]

  resources :categories, only: [:show]

  resources :categories, only: [:create, :destroy]

  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"

  get "home", to: "pages#home"

  root "pages#home"
end
