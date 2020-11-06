class AddUserIdToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :user_id, :integer
  end
end
