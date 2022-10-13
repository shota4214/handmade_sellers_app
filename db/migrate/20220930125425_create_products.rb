class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :image
      t.integer :product_cost_price, null: false, default: 0
      t.integer :sales_price, null: false, default: 0
      t.float :cost_rate, null: false, default: 0
      t.date :create_date
      t.integer :product_stock, null: false, default: 0
      t.text :remarks
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
