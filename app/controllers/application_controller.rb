module LocaleController
  private
    def filter_locale(locale)
      return nil if locale.nil?
      language = locale.to_s.split("-", 2).first&.to_sym
      locale = locale.to_sym
      I18n.available_locales.include?(locale) ? locale : (I18n.available_locales.include?(language) ? language : nil)
    end

    def configure_locale(config = {})
      cookies.permanent[:locale] = filter_locale(config[:new]) if config[:new]
      I18n.locale = filter_locale(cookies.permanent[:locale])
      return if cookies.permanent[:locale]
      browser = filter_locale(HTTP::Accept::Languages.parse(request.headers["Accept-Language"] || "").first&.locale)
      I18n.locale = cookies.permanent[:locale] = (browser || I18n.default_locale)
    end
end

module ApplicationSession
  private
    def session_user_destroy
      cookies.encrypted[:session_user] = nil
    end

    def session_user=(user_id)
      # Protecte agains malicious crafted user_id's
      cookies.encrypted[:session_user] = (user_id&.integer? ? user_id : nil)
    end

    def session_user
      # Protect against malicious crafted cookies
      user_id = cookies.encrypted[:session_user]
      user_id&.integer? ? (user_id) : (session_user_destroy; nil)
    end

    def signed_in?
      # There is no need for this, its pure convenience :D
      session_user ? true : false
    end

    def current_user
      signed_in? ? User.find(session_user) : nil
    rescue ActiveRecord::RecordNotFound
      # Protect against malicious crafted User IDs
      session_user_destroy
      nil
    end
end

class ApplicationController < ActionController::Base
  include LocaleController
  include ApplicationSession

  before_action :configure_locale

  helper_method :current_user
  helper_method :signed_in?
end
