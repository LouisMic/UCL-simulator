class AddDefaultValuesToClubs < ActiveRecord::Migration[7.1]
  def change
    change_column :clubs, :points, :integer, :default => 0
    change_column :clubs, :goals_against, :integer, :default => 0
    change_column :clubs, :goals_scored, :integer, :default => 0
  end
end
