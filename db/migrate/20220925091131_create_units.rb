class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
