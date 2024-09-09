class AddDefaultValuesToGames < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :home_score, :integer, :default => 0
    change_column :games, :away_score, :integer, :default => 0
  end
end
