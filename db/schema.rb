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

ActiveRecord::Schema.define(version: 20150901045144) do

  create_table "admin_users", force: :cascade do |t|
    t.string "username",        limit: 255
    t.string "password_digest", limit: 255, null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id",   limit: 4
    t.integer "product_id", limit: 4
    t.integer "quantity",   limit: 4,                null: false
    t.decimal "price",                precision: 10, null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "client_name",    limit: 255,                null: false
    t.string   "client_address", limit: 255,                null: false
    t.datetime "order_datetime",                            null: false
    t.decimal  "overall_price",              precision: 10
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "orders", ["client_name"], name: "index_orders_on_client_name", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255,                  null: false
    t.decimal  "price",                     precision: 10, null: false
    t.text     "details",     limit: 65535,                null: false
    t.string   "picture_url", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "products", ["name"], name: "index_products_on_name", using: :btree

end
