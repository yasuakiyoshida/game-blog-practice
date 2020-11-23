class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: [:index, :destroy]

  def index
  end

  private
  
  def if_not_admin # 管理者以外でアクションを実行する場合は、ルートにリダイレクト
    redirect_to root_path unless current_user.admin?
  end
  
  def set_user # アクションで使用する変数をセット
    @users = User.all
  end
end
