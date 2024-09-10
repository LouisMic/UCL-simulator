class CreatePredictions < ActiveRecord::Migration[7.1]
  def change
    create_table :predictions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
