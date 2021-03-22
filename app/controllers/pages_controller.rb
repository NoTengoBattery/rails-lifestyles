class PagesController < ApplicationController
  before_action :sign_in!, except: [:home]

  def home
    @featured = Article.featured
    @categories = Category.top_categories
  end
end
