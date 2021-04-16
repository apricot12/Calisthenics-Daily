class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @categories = Category.all
    @nav_categories = Category.all
    @category_article = @categories.map { |c| [c, c.articles.order(created_at: :desc).first] }
    @most_popular = most_popular[0]
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by(id: params[:id])
    @category_articles = @category.articles.includes(:image_attachment).paginate(page: params[:page],
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
