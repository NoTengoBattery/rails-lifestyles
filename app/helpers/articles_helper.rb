module ArticlesHelper
  def img_large(record = @article)
    img_scale(record: record, w: 1920)
  end

  def img_medium(record = @article)
    img_scale(record: record, w: 480)
  end

  def list_categories(record = @article)
    capture do
      record.categories.distinct.each do |category|
        concat link_to(category.Name, category, class: "badge badge-primary mx-1")
      end
    end
  end

  private
    def img_scale(params = {})
      params[:record].image.variant(resize_to_fit: [params[:w], nil], convert: :webp, quality: 90).processed
    end
end
