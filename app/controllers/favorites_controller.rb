class FavoritesController < ApplicationController
  
  def create
    game = Game.find(params[:game_id]) # パラメータ(game_id)で指定された投稿(gameテーブル)を検索して、変数に格納
    favorite = current_user.favorites.new(game_id: game.id) # favorite = Favorite.new(game_id: game.id) \ current_user_id = current_user.idと同じ
    # favorite = Favorite.new(game_id: game.id) # 上で取得した投稿IDをgame_idカラムに格納し、favoriteインスタンスに渡す
    # current_user_id = current_user.id # 『いいね』したユーザー（ログインユーザー）のIDを取得
    favorite.save
    redirect_to game_path(game) # 投稿詳細画面にリダイレクト
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_user.favorites.find_by(game_id: game.id) # 生成したfavoriteモデルのインスタンスのuser_idカラムにcurrent_user（ログインユーザー）を、game_idカラムに上で取得した投稿IDを格納
    favorite.destroy
    redirect_to game_path(game)
  end
  
end