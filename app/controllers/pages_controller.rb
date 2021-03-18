class PagesController < ApplicationController
  def home
    @featured = Article.featured
    @categories = Category.top_categories
  end
end
