module VotesHelper
  def can_vote?(article = @article)
    article.user != current_user
  end

  def vote_button(article = @article, params = {})
    vote = article.votes.find_by(user: current_user)
    if vote
      thumb = "subtract"
      label = "-1"
      path = vote_path(vote)
      params[:method] = :delete
    else
      thumb = "add"
      label = "+1"
      path = votes_path(vote: { ArticleId: article.id })
      params[:method] = :post
    end
    content_tag(:span, "", class: :iconify, "data-icon": "ri-#{thumb}-fill", "data-inline": false) +
    "\n" +
    link_to(label, path, params)
  end
end
