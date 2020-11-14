class PostCommentsController < ApplicationController
  
  def create
    game = Game.find(params[:game_id]) # パラメータ(game_id)で指定された投稿を検索して、変数に格納
    comment = current_user.post_comments.new(post_comment_params) # comment = PostComment.new(post_comment_params) \ comment.user_id = current.user.idと同じ -->
    # comment = PostComment.new(post_comment_params) # コメントを取得し、生成したcommentインスタンスに渡す
    # comment.user_id = current.user.id # コメントしたユーザー（ログインユーザー）のIDを取得
    comment.game_id = game.id # PostCommentモデルのgame_idカラムに、上のパラメータで渡された投稿ID(Gameモデルのidカラム)を渡す
    comment.save
    redirect_to game_path(game) # 投稿詳細画面にリダイレクト
  end
  
  def destroy
    PostComment.find_by(id: params[:id], game_id: params[:game_id]).destroy # パラメータ(id,game_id)で指定されたコメントと投稿を検索して削除(URLにidが2つ)
    redirect_to game_path(params[:game_id])
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end