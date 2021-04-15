class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @nav_categories = Category.all
    @articles_per_cat = Article.articles_per_category(@category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_cat)
    if @category.save
      flash[:notice] = "New category created!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_cat
    params.require(:category).permit(:name)
  end
end
