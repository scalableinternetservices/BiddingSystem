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

ActiveRecord::Schema.define(version: 20161021221512) do

  create_table "bids", primary_key: "bid_id", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.float    "bid_amount"
    t.date     "bidding_date"
    t.time     "bidding_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "categories", primary_key: "category_id", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", primary_key: "product_id", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.date     "date_added"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "products_under_bids", primary_key: "product_bid_id", force: :cascade do |t|
    t.integer  "product_id"
    t.float    "minimum_bidding_price"
    t.float    "maximum_bidding_price"
    t.boolean  "bid_status"
    t.boolean  "sell_status"
    t.date     "bid_start_date"
    t.time     "bid_start_time"
    t.date     "bid_end_date"
    t.time     "bid_end_time"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["product_id"], name: "index_products_under_bids_on_product_id"
  end

end
