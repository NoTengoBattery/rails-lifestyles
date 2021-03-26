module VotesHelper
  def vote_button(article = @article, params = {})
    return if article.user == current_user
    vote = article.votes.of_user(current_user)
    unless vote.empty?
      thumb = "subtract"
      label = "-1"
      path = vote_path(vote.first)
      params[:method] = :delete
    else
      thumb = "add"
      label = "+1"
      path = votes_path(vote: { ArticleId: article.id })
      params[:method] = :post
    end
    content_tag(:span, "", class: :iconify, "data-icon": "ri:#{thumb}-fill", "data-inline": false) +
    "\n" +
    link_to(label, path, params)
  end
end
