class CategoriesController < ApplicationController
  before_action :category_from_params, only: [:show]

  private
    def category_from_params
      @category = Category.includes(:articles).find(params.require(:id))
      @articles = @category.articles.includes(:user).recent
    end
end
