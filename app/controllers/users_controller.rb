class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @games = @user.games.page(params[:page]).reverse_order #@userに関連付けられた投稿（.game）のみ@gamesに渡す
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end