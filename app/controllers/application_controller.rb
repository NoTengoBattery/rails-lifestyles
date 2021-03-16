class ApplicationController < ActionController::Base
  before_action :configure_locale

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
