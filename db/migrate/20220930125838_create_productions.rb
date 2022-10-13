class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.references :material, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :use_material_number, null: false, default: 0
      t.integer :use_cost_price, null: false, default: 0

      t.timestamps
    end
  end
end
