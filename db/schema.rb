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

ActiveRecord::Schema.define(version: 2018_11_27_024857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sport_id"
    t.time "join_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_bookings_on_sport_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sport_id"
    t.text "content"
    t.boolean "read_status", default: false
    t.time "msg_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_messages_on_sport_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.boolean "read_status", default: false
    t.time "msg_time"
    t.bigint "user_id"
    t.bigint "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_replies_on_message_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "description"
    t.time "start_time"
    t.time "end_time"
    t.float "price"
    t.string "photo"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.integer "capacity"
    t.string "level"
    t.integer "like", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "open_id"
    t.string "gender"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "avatarUrl"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "sports"
  add_foreign_key "bookings", "users"
  add_foreign_key "messages", "sports"
  add_foreign_key "messages", "users"
  add_foreign_key "replies", "messages"
  add_foreign_key "replies", "users"
  add_foreign_key "sports", "users"
end
