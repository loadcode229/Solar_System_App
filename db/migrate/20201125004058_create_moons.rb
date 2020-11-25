class CreateMoons < ActiveRecord::Migration[6.0]
  def change
    create_table :moons do |t|
      t.string :name
      t.string :planet_moon_orbits
      t.text :description
      t.string :length_of_year
      t.integer :user_id

      t.timestamps
    end
  end
end
