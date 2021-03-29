class CategoriesController < ApplicationController
  before_action :category_from_params, only: [:show]

  private
    def category_from_params
      @category = Category.find(params.require(:id))
      @articles = Article.of_category(@category.id).recent
    end
end
