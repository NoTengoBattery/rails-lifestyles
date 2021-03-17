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
    def session_user=(user_id); cookies.encrypted[:session_user] = user_id; end
    def session_user; cookies.encrypted[:session_user]; end

    def current_user
      session_user ? (@_current_user ||= User.find(session_user)) : nil
    end
end

class ApplicationController < ActionController::Base
  include LocaleController
  include ApplicationSession

  before_action :configure_locale
end
