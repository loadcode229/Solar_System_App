class AddImageToPlanetMoons < ActiveRecord::Migration[6.0]
  def change
    add_column :planet_moons, :image, :string
  end
end
