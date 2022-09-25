# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_25_125018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigns", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_assigns_on_shop_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "material_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "material_category_assigns", force: :cascade do |t|
    t.bigint "material_category_id"
    t.bigint "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_category_id"], name: "index_material_category_assigns_on_material_category_id"
    t.index ["material_id"], name: "index_material_category_assigns_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false
    t.integer "purchase_price", default: 0, null: false
    t.integer "purchase_number", default: 0, null: false
    t.integer "per_price", default: 0, null: false
    t.date "purchase_date"
    t.text "image"
    t.integer "stock", default: 0, null: false
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id", null: false
    t.index ["shop_id"], name: "index_materials_on_shop_id"
  end

  create_table "shop_links", force: :cascade do |t|
    t.text "twitter_url"
    t.text "facebook_url"
    t.text "instagram_url"
    t.text "tiktok_url"
    t.text "youtube_url"
    t.text "website_url"
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_links_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id"
    t.text "image"
    t.string "email"
    t.text "shop_url"
    t.string "telephone_number"
    t.string "post_code"
    t.string "address"
    t.date "opening_date"
    t.date "business_start"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_shops_on_owner_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_suppliers_on_material_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_units_on_material_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.text "image"
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assigns", "shops"
  add_foreign_key "assigns", "users"
  add_foreign_key "material_category_assigns", "material_categories"
  add_foreign_key "material_category_assigns", "materials"
  add_foreign_key "materials", "shops"
  add_foreign_key "shop_links", "shops"
  add_foreign_key "shops", "users", column: "owner_id"
  add_foreign_key "suppliers", "materials"
  add_foreign_key "units", "materials"
end
