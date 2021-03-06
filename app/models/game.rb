class Game < ApplicationRecord
  
  acts_as_taggable
  # acts_as_taggable_on :tags と同じ意味のエイリアス
  # tags のなかにIDやら名前などが入る。イメージ的には親情報。
  # tags のカラムを追加できる
  
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :game_title, presence: true, length: {minimum: 2}
  validates :impressions, presence: true

  def favorited_by?(user) # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べるメソッドを定義
    favorites.where(user_id: user.id).exists? # モデル名.where(任意のカラム名: 格納されている値) user_idカラムの全レコードを検索し、user.idが含まれているか確認
  end
  
end