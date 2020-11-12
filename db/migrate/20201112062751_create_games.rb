class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :game_title
      t.string :image_id
      t.text :impressions
      t.integer :user_id

      t.timestamps
    end
  end
end
