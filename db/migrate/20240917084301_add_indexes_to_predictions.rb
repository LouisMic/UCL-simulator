class AddIndexesToPredictions < ActiveRecord::Migration[7.1]
  def change
    add_index :predictions, [:user_id, :game_id], unique: true
  end
end
