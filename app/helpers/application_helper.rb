module ApplicationHelper
  def locale_link(name, id)
    link_to name, site_locale_path(id), method: "patch"
  end
end
