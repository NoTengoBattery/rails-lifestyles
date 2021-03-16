require "rails_helper"

RSpec.describe LocalesController, type: :controller do
  describe "#default_locale" do
    before do
      I18n.default_locale = :en
      I18n.available_locales = [:en, :"en-US", :es]
      cookies.permanent[:locale] = nil
      request.headers["Accept-Language"] = nil
    end
    it "sets the default locale without hints" do
      put :default_locale
      expect(cookies.permanent[:locale]).to eq(I18n.default_locale)
    end
    it "sets the default locale with broser hints" do
      request.headers["Accept-Language"] = "es;q=1.0"
      put :default_locale
      expect(cookies.permanent[:locale]).not_to eq(I18n.default_locale)
      expect(cookies.permanent[:locale]).to eq(:es)
    end
  end
  describe "#site_locale" do
    before do
      I18n.default_locale = :en
      I18n.available_locales = [:en, :"en-US", :es]
      cookies.permanent[:locale] = nil
    end
    it "sets a simple locale from the supported list" do
      patch :site_locale, params: { locale: :es }
      expect(cookies.permanent[:locale]).to eq(:es)
    end
    it "sets a composed locale from the supported list" do
      patch :site_locale, params: { locale: :"en-US" }
      expect(cookies.permanent[:locale]).to eq(:"en-US")
    end
    it "sets a simple locale from a partially supported composed locale" do
      patch :site_locale, params: { locale: :"es-GT" }
      expect(cookies.permanent[:locale]).to eq(:es)
    end
    it "sets a default locale from an unsupported locale" do
      request.headers["Accept-Language"] = nil
      patch :site_locale, params: { locale: :ru }
      expect(cookies.permanent[:locale]).to eq(I18n.default_locale)
    end
    it "sets a browser-prefered somple locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es;q=1.0"
      patch :site_locale, params: { locale: :ru }
      expect(cookies.permanent[:locale]).not_to eq(I18n.default_locale)
      expect(cookies.permanent[:locale]).to eq(:es)
    end
    it "sets a browser-prefered composed locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es-GT;q=1.0"
      patch :site_locale, params: { locale: :ru }
      expect(cookies.permanent[:locale]).not_to eq(I18n.default_locale)
      expect(cookies.permanent[:locale]).to eq(:es)
    end
    it "changes the locale after it's set" do
      patch :site_locale, params: { locale: :"en-US" }
      expect(cookies.permanent[:locale]).to eq(:"en-US")
      patch :site_locale, params: { locale: :"es" }
      expect(cookies.permanent[:locale]).to eq(:"es")
    end
  end
end
