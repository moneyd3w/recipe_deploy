class AddShotToIngredient < ActiveRecord::Migration[7.1]
  def change
    remove_column :ingredients, :user_shot if column_exists?(:ingredients, :user_shot)
    add_column :ingredients, :user_shot, :string
  end
end
