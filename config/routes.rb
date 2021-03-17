Rails.application.routes.draw do
  get 'users/sign_up'
  get 'users/sign_in'
  get 'users/sign_out'
  get 'users/edit'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "placeholders#index"
  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"
end
