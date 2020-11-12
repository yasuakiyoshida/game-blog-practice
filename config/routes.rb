Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :games, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy] # 投稿に対してコメントされるためpost_commentsは、gamesにネストする
  end
end