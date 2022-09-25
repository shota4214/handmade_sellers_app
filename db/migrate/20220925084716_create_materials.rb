class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.integer :purchase_price, null: false, default: 0
      t.integer :purchase_number, null: false, default: 0
      t.integer :per_price, null: false, default: 0
      t.date :purchase_date
      t.text :image
      t.integer :stock, null: false, default: 0
      t.text :remarks

      t.timestamps
    end
  end
end
