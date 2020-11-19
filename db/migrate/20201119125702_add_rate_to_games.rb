class AddRateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :rate, :float
  end
end
