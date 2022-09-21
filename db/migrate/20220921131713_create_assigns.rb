class CreateAssigns < ActiveRecord::Migration[6.0]
  def change
    create_table :assigns do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
