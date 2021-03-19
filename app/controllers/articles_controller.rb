class ArticlesController < ApplicationController
  before_action :empty_article
  before_action :article_from_params, only: [:edit, :show]

  def create
    @article = current_user.articles.build(article_params)
    @article.CreatedAt = Time.now
    byebug
    if @article.save
      redirect_to @article, notice: I18n.t("article.notice.create")
    else
      flash.now[:alert] = I18n.t("article.alert.create")
      render :new
    end
  end

  private
    def article_from_params
      @article = Article.find(params.require(:id))
      @author = User.find(@article.AuthorId)
    end

    def article_params
      params.require(:article).permit(:Title, :Image, :Text, category_ids: [])
    end

    def empty_article
      @article = Article.new
      @categories = Category.top_categories
    end
end
