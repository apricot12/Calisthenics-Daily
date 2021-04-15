class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @categories = Category.all
    @nav_categories = Category.all.limit(5)
    @articles = Article.all
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
