class ApplicationController < ActionController::Base
  include Localizable
  include Authenticable

  before_action :configure_locale
  before_action :sign_in!

  helper_method :current_user
  helper_method :signed_in?
end
