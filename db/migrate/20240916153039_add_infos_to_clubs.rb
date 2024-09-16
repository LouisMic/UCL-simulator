class AddInfosToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :coeff_full, :float
    add_column :clubs, :coeff_last, :float
    add_column :clubs, :country, :string
  end
end
