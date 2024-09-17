class AddIndexesToGames < ActiveRecord::Migration[7.1]
  def change
    add_index :games, [:home_team_id, :away_team_id]
    add_index :games, :gametime
  end
end
