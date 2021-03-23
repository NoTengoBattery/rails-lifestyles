module CategoriesHelper
  def toggle_order
    @_flex_order ||= 0
    @_flex_order += 1
    @_flex_order.even? ? "" : " order-1"
  end
end
