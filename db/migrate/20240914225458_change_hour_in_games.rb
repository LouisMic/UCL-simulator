class ChangeHourInGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :hour
    add_column :games, :gametime, :datetime
  end
end
