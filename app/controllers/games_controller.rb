class GamesController < ApplicationController
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.save
    redirect_to games_path
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @post_comment = PostComment.new # コメント投稿用のインスタンス変数
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
  
  private

  def game_params
    params.require(:game).permit(:game_title, :image, :impressions)
  end
end