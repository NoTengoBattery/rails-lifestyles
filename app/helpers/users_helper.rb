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

  def render_user_articles(list = @articles)
    capture do
      if @articles.size >= 1
        list.each do |record|
          concat render "users/article", article: record
        end
      else
        content_tag(:p) do
          concat content_tag(:span, nil, class: :iconify, 'data-icon': "ri:error-warning-fill", 'data-inline': false)
          concat I18n.t("user.no_articles")
        end
      end
    end
  end

  def authorized?
    @user.class == User && current_user.id == @user.id
  end
end
