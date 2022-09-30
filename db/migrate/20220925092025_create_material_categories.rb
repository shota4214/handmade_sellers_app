class CreateMaterialCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :material_categories do |t|
      t.string :name, null: false
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
