Rails.application.routes.draw do
  resources :articles, only: [:new, :create, :show] do
    resources :votes, only: %i[create destroy]
  end
  devise_for :users
  resources :categories, only: %i[new create show index]
  root 'categories#index'
end
