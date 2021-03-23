class PagesController < ApplicationController
  before_action :sign_in!, except: [:home]

  def home
    @featured = Article.featured.class == Article ? Article.featured : Article.featured.first
    @categories = Category.includes(:articles).top_categories
  end
end
