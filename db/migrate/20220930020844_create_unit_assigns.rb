class CreateUnitAssigns < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_assigns do |t|
      t.references :material, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
