class RenameTypeToTypeOfPlanet < ActiveRecord::Migration[6.0]
  def change
    rename_column :planets, :type, :type_of_planet
  end
end
