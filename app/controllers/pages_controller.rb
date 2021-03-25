class PagesController < ApplicationController
  before_action :sign_in!, except: [:home]

  def home
    @featured = Article.featured.class == Article ? Article.featured : Article.featured.first
    @categories = Category.top_categories.first(4)
  end
end
