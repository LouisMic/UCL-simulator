class AddHourToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :hour, :time
  end
end
