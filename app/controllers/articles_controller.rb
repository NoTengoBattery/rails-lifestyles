class ArticlesController < ApplicationController
  before_action :empty_article
  before_action :article_from_params, except: [:create, :new]

  before_action :authorize!, only: [:edit, :update, :destroy]

  def create
    @article = current_user.articles.build(article_params)
    @article.CreatedAt = Time.now
    if @article.save
      redirect_to @article, notice: I18n.t("article.notice.create")
    else
      flash.now[:alert] = I18n.t("article.alert.create")
      render :new
    end
  end

  def update
    @article.update(article_params)
    if @article.valid?
      redirect_to @article, notice: I18n.t("article.notice.edit")
    else
      flash.now[:alert] = I18n.t("article.alert.edit")
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: I18n.t("article.notice.destroy")
  end

  private
    def article_from_params
      @article = Article.find(params.require(:id))
      @author = @user = User.find(@article.AuthorId)
    end

    def article_params
      params.require(:article).permit(:Title, :Text, :image, category_ids: [])
    end

    def empty_article
      @article = Article.new
      @categories = Category.ordered_categories
    end
end
