class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.date :date
      t.integer :home_score
      t.integer :away_score
      t.references :matchday, null: false, foreign_key: true
      t.references :home_team, null: false, foreign_key: { to_table: :clubs }
      t.references :away_team, null: false, foreign_key: { to_table: :clubs }

      t.timestamps
    end
  end
end
