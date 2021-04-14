class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @cat = Category.all
  end

  def create
    @article = current_user.articles.build(params_article)
    if @article.save
      redirect_to root_path
      flash[:notice] = 'Your article has been submitted!'
    else
      render :new
    end
  end

  private

  def params_article
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
