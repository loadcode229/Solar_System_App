class AddCategoryIdToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :category_id, :integer
  end
end
