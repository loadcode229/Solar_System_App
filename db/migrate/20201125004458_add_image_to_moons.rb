class AddImageToMoons < ActiveRecord::Migration[6.0]
  def change
    add_column :moons, :image, :string
  end
end
