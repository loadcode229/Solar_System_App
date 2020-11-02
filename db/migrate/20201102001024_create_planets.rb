class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :length_of_year
      t.string :distance_from_sun
      t.string :moons

      t.timestamps
    end
  end
end
