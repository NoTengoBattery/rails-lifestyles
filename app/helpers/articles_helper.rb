module ArticlesHelper
  def img_large(record = @article)
    img_scale(record: record, w: 1920)
  end
  def img_medium(record = @article)
    img_scale(record: record, w: 480)
  end

  private
    def img_scale(params = {})
      params[:record].image.variant(resize_to_fit: [params[:w], nil], convert: :webp, quality: 90).processed
    end
end
