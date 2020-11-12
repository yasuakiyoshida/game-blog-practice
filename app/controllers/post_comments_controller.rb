class PostCommentsController < ApplicationController
  
  def create
    game = Game.find(params[:game_id]) # パラメータ(game_id)で指定された投稿を検索して、変数に格納
    comment = current_user.post_comments.new(post_comment_params) # comment = PostComment.new(post_comment_params) \ comment.user_id = current.user.idと同じ -->
    # comment = PostComment.new(post_comment_params) # コメントを生成
    # comment.user_id = current.user.id # 生成したコメントのユーザーIDにコメント投稿者のIDを設定
    comment.game_id = game.id # 生成したコメントの投稿(game)IDにパラメータで渡された投稿IDを設定
    comment.save
    redirect_to game_path(game) # 投稿詳細画面にリダイレクト
  end
  
  def destroy
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end