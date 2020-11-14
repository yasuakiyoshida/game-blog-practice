Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :games, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] # いいね機能のルーティング、showページ不要でidの受け渡しも必要ないので単数系resource
    resources :post_comments, only: [:create, :destroy] # 投稿に対してコメントされるためpost_commentsは、gamesにネストする
  end
  resources :users, only: [:show, :edit]
end