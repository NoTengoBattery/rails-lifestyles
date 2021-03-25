class CategoriesController < ApplicationController
  before_action :category_from_params, only: [:show]

  private
    def category_from_params
      @category = Category.includes(:articles).find(params.require(:id))
      @articles = @category.articles.with_attached_image.recent
    end
end
