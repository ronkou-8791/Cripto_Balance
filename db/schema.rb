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

ActiveRecord::Schema.define(version: 20171023225126) do

  create_table "Ethbtcs", force: :cascade do |t|
    t.datetime "buy"
    t.integer "buy_size"
    t.datetime "sell"
    t.integer "sell_size"
    t.decimal "price", precision: 9, scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gains", force: :cascade do |t|
    t.integer "gain_price"
    t.integer "purchase_price"
    t.integer "currrent_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "purchase"
    t.datetime "sell"
  end

  create_table "shares", force: :cascade do |t|
    t.datetime "create_at"
    t.integer "coin"
    t.integer "btcjpy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
  end

end
