module CategoriesHelper
  def toggle_order
    @_flex_order ||= 0
    @_flex_order += 1
    @_flex_order.even? ? "" : " order-1"
  end

  def show_articles(record = @articles)
    if record.size >= 1
      content_tag(:main, nil, class: "row m-0") do
        concat render @articles, category: @category, id: "article"
      end
    else
      content_tag(:p) do
        concat content_tag(:span, nil, class: :iconify, 'data-icon': "ri:error-warning-fill", 'data-inline': false)
        concat I18n.t("category.no_articles")
      end
    end
  end
end
