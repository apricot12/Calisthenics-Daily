module ArticlesHelper
  def vote(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      content_tag(:div) do
        # link_to article_vote_path(article), method: :delete,
        link_to fa_icon('thumbs-down', class: 'text-decoration-none link-dark fs-5 mx-2'), article_vote_path(article),
                method: :delete
      end
    else
      content_tag(:div) do
        link_to fa_icon('thumbs-up', class: 'text-decoration-none link-dark fs-5 mx-2'),
                article_votes_path(article_id: article.id), method: :post
      end
    end
  end
end
