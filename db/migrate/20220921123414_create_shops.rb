class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.integer :owner_id, index: true
      t.text :image
      t.string :email
      t.text :shop_url
      t.string :telephone_number
      t.string :post_code
      t.string :address
      t.date :opening_date
      t.date :business_start
      t.text :content

      t.timestamps
    end
    add_foreign_key :shops, :users, column: :owner_id
  end
end
