class CreateMaterialCategoryAssigns < ActiveRecord::Migration[6.0]
  def change
    create_table :material_category_assigns do |t|
      t.references :material_category, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
