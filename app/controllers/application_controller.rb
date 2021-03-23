module LocaleSession
  private
    def cookie_locale
      cookies.permanent[:locale]
    end

    def cookie_locale=(locale)
      cookies.permanent[:locale] = local
    end

    def i18n_locale=(locale)
      I18n.locale = cookies.permanent[:locale] = locale
    end

    def filter_locale(locale)
      return nil if locale.nil?
      language = locale.to_s.split("-", 2).first&.to_sym
      locale = locale.to_sym
      I18n.available_locales.include?(locale) ? locale : (I18n.available_locales.include?(language) ? language : nil)
    end

    def configure_locale(config = {})
      self.cookie_locale = self.filter_locale(config[:new]) if config[:new]
      self.i18n_locale = self.filter_locale(self.cookie_locale)
      return if self.cookie_locale
      browser = self.filter_locale(HTTP::Accept::Languages.parse(request.accept_language || "").first&.locale)
      self.i18n_locale = (browser || I18n.default_locale)
    end
end

module ApplicationSession
  private
    def session_user=(user_id) # Protect agains malicious crafted user_id's
      cookies.encrypted[:session_user] = (user_id&.integer? ? user_id : nil)
    end

    def session_user_destroy
      cookies.delete(:session_user)
      @_user = nil
    end

    def session_user # Protect against malicious crafted cookies
      user_id = cookies.encrypted[:session_user]
      user_id&.integer? ? (user_id) : (self.session_user_destroy; nil)
    end

    def current_user
      self.session_user ? (@_user ||= User.find(self.session_user)) : nil
    rescue ActiveRecord::RecordNotFound # Protect against malicious crafted User IDs
      self.session_user_destroy
      nil
    end

    def signed_in?
      self.current_user ? true : false
    end

    def backpath_set
      cookies[:backpath] = request.path if request.request_method_symbol == :get
    end

    def backpath
      cookies.delete(:backpath)
    end

    def sign_in!
      unless signed_in?
        backpath_set
        redirect_to sign_in_path, alert: I18n.t("user.alert.need_sign_in")
      end
      true
    end

    def authorize!
      unless @user.class == User && self.current_user.id == @user.id
        redirect_back fallback_location: root_path, alert: I18n.t("user.alert.unauthorized")
      end
    end
end

class ApplicationController < ActionController::Base
  include LocaleSession
  include ApplicationSession

  before_action :configure_locale
  before_action :sign_in!

  helper_method :current_user
  helper_method :signed_in?
end
