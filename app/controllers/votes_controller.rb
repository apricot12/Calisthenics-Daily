class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    @article = Article.find_by(id: @vote.article.id)
    if @vote.save
      redirect_to category_path(@article.category)
      flash[:notice] = "You've upvoted this article!"
    else
      flash[:notice] = 'Oops! Something went wrong.'
    end
  end

  def destroy
    vote = Vote.find_by(user: current_user, article_id: params[:article_id])
    @article = Article.find_by(id: vote.article.id)
    if vote
      vote.destroy
      redirect_to category_path(@article.category)
      flash[:notice] = 'You have removed your upvote!'
    else
      redirect_to root_path
      flash[:notice] = 'Oops! Something went wrong.'
    end
  end
end
