class AddShopRefToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_reference :materials, :shop, null: false, foreign_key: true
    add_reference :materials, :unit, null: false, foreign_key: true
    add_reference :materials, :supplier, null: false, foreign_key: true
  end
end
