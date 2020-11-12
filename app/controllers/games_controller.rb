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
    @game = Game.all
  end

  def show
  end

  def destroy
  end
  
  private

  def game_params
    params.require(:game).permit(:game_title, :image, :impressions)
  end
end