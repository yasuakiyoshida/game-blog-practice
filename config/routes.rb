Rails.application.routes.draw do
  get 'users/show'
  
  get "/admin" => "admin/users#index" # 管理者画面のルーティング
  namespace :admin do # namespace do〜endで、adminルーティングの配下にusersルーティング設定
    resources :users, only: [:index, :destroy]
  end

  
  devise_for :users
  root to: 'homes#top'
  resources :games, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] # いいね機能のルーティング、showページ不要でidの受け渡しも必要ないので単数系resource
    resources :post_comments, only: [:create, :destroy] # 投稿に対してコメントされるためpost_commentsは、gamesにネストする
  end
  resources :users, only: [:show, :edit, :update, :index]
end