class CreateSupplierAssigns < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_assigns do |t|
      t.references :material, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
