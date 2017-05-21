# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170521144419) do

  create_table "babies", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 255
    t.string   "size",       limit: 28
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "billings", force: :cascade do |t|
    t.integer  "ordermaster_id", limit: 4
    t.string   "name",           limit: 30
    t.string   "email",          limit: 80
    t.string   "contact",        limit: 40
    t.string   "country",        limit: 50
    t.string   "zip",            limit: 40
    t.text     "address",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "cameras", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.string   "pixel",      limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "maincategory_id", limit: 4
    t.string   "category",        limit: 25
    t.boolean  "is_active",                  default: true
    t.integer  "created_by",      limit: 4
    t.integer  "updated_by",      limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "cosmetics", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.string   "color",      limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "furnitures", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 30
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "hairs", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "length",     limit: 25
    t.string   "color",      limit: 25
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "homefurnishings", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 30
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "kidsclothings", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 20
    t.string   "size",       limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "kitchenappliances", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 30
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "laptops", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "os",         limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "maincategories", force: :cascade do |t|
    t.string   "main_category", limit: 25
    t.boolean  "is_active",                default: true
    t.integer  "created_by",    limit: 4
    t.integer  "updated_by",    limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "menclothings", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 20
    t.string   "size",       limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "mobiles", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "os",         limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "orderdetails", force: :cascade do |t|
    t.integer  "ordermaster_id", limit: 4
    t.integer  "product_id",     limit: 4
    t.decimal  "cost",                      precision: 10, scale: 2
    t.decimal  "row_total",                 precision: 10, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "quantity",       limit: 20
  end

  create_table "ordermasters", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "total_products", limit: 10
    t.decimal  "total_cost",                precision: 10, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "photo1",     limit: 50
    t.string   "photo2",     limit: 50
    t.string   "photo3",     limit: 50
    t.string   "photo4",     limit: 50
    t.string   "photo5",     limit: 50
    t.string   "photo6",     limit: 50
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "subcategory_id", limit: 4
    t.string   "product_name",   limit: 25
    t.string   "product_code",   limit: 30
    t.string   "typee",          limit: 25
    t.decimal  "price",                     precision: 10, scale: 2
    t.string   "brand",          limit: 20
    t.string   "popularity",     limit: 20
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.integer  "ordermaster_id",   limit: 4
    t.string   "shipping_name",    limit: 30
    t.string   "shipping_contact", limit: 40
    t.string   "shipping_zip",     limit: 40
    t.text     "shipping_address", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "shoes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.string   "color",      limit: 20
    t.string   "size",       limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "smallappliances", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 255
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "subcategory", limit: 255
    t.boolean  "is_active",               default: true
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "tablets", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "os",         limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "userdetails", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 25
    t.string   "number",       limit: 25
    t.string   "profile_pic",  limit: 25
    t.string   "shop_name",    limit: 25
    t.string   "shop_address", limit: 25
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        limit: 80
    t.string   "password",                     limit: 50
    t.boolean  "is_active",                                default: true
    t.boolean  "is_admin",                                 default: false
    t.boolean  "is_seller",                                default: false
    t.string   "provider",                     limit: 255
    t.string   "uid",                          limit: 255
    t.string   "name",                         limit: 255
    t.integer  "created_by",                   limit: 4
    t.integer  "updated_by",                   limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.boolean  "expired",                                  default: false
    t.string   "password_reset_token",         limit: 255
    t.datetime "password_reset_token_sent_at"
  end

  create_table "womenbags", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 255
    t.string   "material",   limit: 28
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "womenclothings", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "color",      limit: 20
    t.string   "size",       limit: 20
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
