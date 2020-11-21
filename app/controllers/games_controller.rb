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
    @games = Game.page(params[:page]).reverse_order # Kaminariのpageメソッドで決められた数のデータだけを取得する、.reverse_orderメソッド(現在のソート順を逆にする)で新着順に取得
    if params[:tag_name]
      @game_tag = Game.tagged_with("#{params[:tag_name]}") # tagged_with("タグ名")メソッド受け取ったtag_nameに値が入っている場合、タグ名で絞り込みを行う
      # @gemesにするとifが実行された際に値が更新されてしまうためインスタンス変数名変えとく
    end
  end
  
  def show
    @game = Game.find(params[:id])
    @post_comment = PostComment.new # コメント投稿用のインスタンス変数
    @post_comments = @game.post_comments.page(params[:page]).per(5) # コメントを全て取得=>コメントを5件取得
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
  
  private

  def game_params
    params.require(:game).permit(:game_title, :image, :impressions, :rate, :tag_list) # 星評価のrateカラム, タグ機能のtag_list
  end
end