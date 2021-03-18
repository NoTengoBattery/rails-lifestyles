module PagesHelper
  def recent_article(category)
    category.most_recent_article
  end
end
