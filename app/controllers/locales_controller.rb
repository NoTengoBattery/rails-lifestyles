class LocalesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:site_locale]

  def site_locale
    configure_locale(new: params[:locale])
    redirect_back fallback_location: root_path
  end

  def default_locale
    cookies.permanent[:locale] = nil
    configure_locale
    redirect_back fallback_location: root_path
  end

  private
    def user_params
      params.require(:locale).permit(:locale)
    end
end
