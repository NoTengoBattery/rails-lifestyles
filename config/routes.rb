Rails.application.routes.draw do
  get "sign_up", to: "users#sign_up"
  get "sign_in", to: "users#sign_in"
  get "sign_out", to: "users#sign_out"
  resources :users, except: [:index, :new]

  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"

  root "users#sign_in"
end
