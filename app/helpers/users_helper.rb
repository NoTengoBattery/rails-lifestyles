module UsersHelper
  def sign_up_or_profile(params = {})
    if signed_in?
      link_to current_user.Name, current_user, params
    else
      link_to I18n.t("user.sign_up"), sign_up_path, params
    end
  end
  def sign_in_or_out(params = {})
    if signed_in?
      params[:method] = :delete
      link_to I18n.t("user.sign_out"), sign_out_path, params
    else
      link_to I18n.t("user.sign_in"), sign_in_path, params
    end
  end
end
