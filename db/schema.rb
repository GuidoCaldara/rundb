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

ActiveRecord::Schema.define(version: 20180309075756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_favorites_on_race_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "state"
    t.string "race_sku"
    t.jsonb "payment"
    t.string "first_name"
    t.string "last_name"
    t.string "group"
    t.string "gender"
    t.string "city"
    t.date "date_of_birth"
    t.index ["race_id"], name: "index_orders_on_race_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "logo"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_organisations_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_photos_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "elevation"
    t.date "date"
    t.string "category"
    t.jsonb "_geoloc", default: {}
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.datetime "starting_time"
    t.date "discount_fee_finish"
    t.date "subscription_start"
    t.date "subscription_end"
    t.text "goodies"
    t.integer "capacity"
    t.text "description"
    t.boolean "bookable", default: false
    t.string "website"
    t.string "subscription_link"
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "first_edition"
    t.string "starting_point"
    t.string "sku"
    t.integer "fee_cents", default: 0, null: false
    t.integer "discount_fee_cents", default: 0, null: false
    t.float "date_stamp"
    t.integer "race_avg_rate"
    t.string "video"
    t.string "photo"
    t.float "route_rate_avg"
    t.float "organisation_rate_avg"
    t.float "value_for_money_avg"
    t.integer "race_distance"
    t.index ["organisation_id"], name: "index_races_on_organisation_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.text "description"
    t.integer "route_rate"
    t.integer "organisation_rate"
    t.integer "value_for_money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "avg_rate"
    t.index ["race_id"], name: "index_reviews_on_race_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "pathfile"
    t.index ["race_id"], name: "index_routes_on_race_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthday"
    t.boolean "admin", default: false
    t.string "avatar"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.string "gender"
    t.string "group"
    t.string "ip"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "races"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "races"
  add_foreign_key "orders", "users"
  add_foreign_key "organisations", "users"
  add_foreign_key "photos", "races"
  add_foreign_key "races", "organisations"
  add_foreign_key "reviews", "races"
  add_foreign_key "reviews", "users"
  add_foreign_key "routes", "races"
end
