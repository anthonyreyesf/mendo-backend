# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_01_015727) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "venue_id", null: false
    t.integer "customer_id", null: false
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["venue_id"], name: "index_bookings_on_venue_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_customers_on_account_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "description"
    t.string "name"
    t.string "phone_number"
    t.string "postal_code"
    t.string "province"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_facilities_on_account_id"
  end

  create_table "operation_hours", force: :cascade do |t|
    t.integer "facility_id", null: false
    t.integer "day_of_week"
    t.string "opens_at"
    t.string "closes_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_operation_hours_on_facility_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  create_table "venue_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_venue_types_on_account_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "facility_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_type_id"
    t.decimal "hourly_rate", default: "0.0"
    t.index ["facility_id"], name: "index_venues_on_facility_id"
    t.index ["venue_type_id"], name: "index_venues_on_venue_type_id"
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "venues"
  add_foreign_key "customers", "accounts"
  add_foreign_key "facilities", "accounts"
  add_foreign_key "operation_hours", "facilities"
  add_foreign_key "users", "accounts"
  add_foreign_key "venue_types", "accounts"
  add_foreign_key "venues", "facilities"
  add_foreign_key "venues", "venue_types"
end
