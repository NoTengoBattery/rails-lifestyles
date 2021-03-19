module ApplicationHelper
  def locale_link(name, id)
    link_to name, site_locale_path(id), method: :patch
  end

  def alert_class(type)
    pre = "alert alert-"
    case type
    when "alert"
      "#{pre}danger"
    when "notice"
      "#{pre}success"
    else
      "#{pre}primary"
    end
  end
end
