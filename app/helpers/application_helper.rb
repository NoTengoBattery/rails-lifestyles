module ApplicationHelper
  def locale_link(name, id, params = {})
    params[:method] = :patch
    link_to name, site_locale_path(id), params
  end

  def alert_class(type)
    pre = "alert"
    case type
    when "alert"
      "#{pre} alert-danger"
    when "notice"
      "#{pre} alert-success"
    else
      "#{pre} alert-primary"
    end
  end

  def social_link(link, icon)
    link_to(link, class: "nav-link d-flex align-items-center justify-content-around footer-social") do
      content_tag(:span, "", class: :iconify, "data-icon": "cib:#{icon}", "data-inline": false)
    end
  end
end
