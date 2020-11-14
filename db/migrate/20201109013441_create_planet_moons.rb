class CreatePlanetMoons < ActiveRecord::Migration[6.0]
  def change
    create_table :planet_moons do |t|
      t.string :name
      t.string :planet_moon_orbits
      t.text :description
      t.string :length_of_year
      t.references :user, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
