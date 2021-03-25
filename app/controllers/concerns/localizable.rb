module Localizable
  extend ActiveSupport::Concern

  private
    def cookie_locale
      cookies.permanent[:locale]
    end

    def cookie_locale=(locale)
      cookies.permanent[:locale] = locale
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
