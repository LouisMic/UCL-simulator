class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :logo
      t.integer :goals_scored
      t.integer :goals_against
      t.integer :points

      t.timestamps
    end
  end
end
