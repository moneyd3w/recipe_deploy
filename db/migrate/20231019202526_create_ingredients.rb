class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :my_type_column, null: false
      t.string :image_type, default: "empty" # for pre-set images
      t.text :recipe, null: false
      t.text :instructions, null: false
      t.text :description, null: false
      t.boolean :featured, default: false

      # use user_info_id to reference
      t.references :user_infos, foreign_key: {on_delete: :cascade, null: false}
      t.timestamps
    end
  end
end
