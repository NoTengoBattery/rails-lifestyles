class ArticlesController < ApplicationController
  before_action :article_from_params, only: [:edit, :show]

  private
    def article_from_params
      @article = Article.find(params.require(:id))
      @author = User.find(@article.AuthorId)
    end
end
