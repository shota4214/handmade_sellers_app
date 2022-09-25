class CreateShopLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_links do |t|
      t.text :twitter_url
      t.text :facebook_url
      t.text :instagram_url
      t.text :tiktok_url
      t.text :youtube_url
      t.text :website_url
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
