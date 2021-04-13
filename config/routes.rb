Rails.application.routes.draw do
  get 'votes/create'
  get 'votes/destroy'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/create'
  devise_for :users
end
