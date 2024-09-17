class AddIndexesToClubs < ActiveRecord::Migration[7.1]
  def change
    add_index :clubs, :points
    add_index :clubs, :country
    add_index :clubs, :coeff_full
    add_index :clubs, :coeff_last
  end
end
