class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    navbar_cats
    @most_popular = most_popular[0]
  end

  def new
    navbar_cats
    @category = Category.new
  end

  def show
    navbar_cats
    @category = Category.find_by(id: params[:id])
    @category_articles = @category.articles.articles_with_images.paginate(page: params[:page],
                                                                          per_page: 4).order(created_at: :desc)
  end

  def create
    @category = Category.new(params_cat)
    if @category.save
      flash[:notice] = 'New category created!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_cat
    params.require(:category).permit(:name)
  end

  def most_popular
    @article_hash = Vote.includes(:article).group(:article).count
    if @article_hash.empty?
      [Article.first, nil]
    else
      @article_hash.max_by { |_article, article_counts| article_counts }
    end
  end
end
