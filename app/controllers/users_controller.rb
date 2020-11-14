class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = @user.games.page(params[:page]).reverse_order #@userに関連付けられた投稿（.game）のみ@gamesに渡す
  end
end