class ApplicationController < ActionController::Base
  def navbar_cats
    @categories = Category.all
    @category_article = @categories.map { |c| [c, c.articles.order(created_at: :desc).first] }
  end
end
