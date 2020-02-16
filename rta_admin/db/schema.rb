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

ActiveRecord::Schema.define(version: 2020_02_15_164511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", force: :cascade do |t|
    t.string "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.integer "gender"
    t.integer "profile_type"
    t.bigint "year_id"
    t.bigint "month_id"
    t.bigint "country_id"
    t.bigint "disease_id"
    t.bigint "age_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_id"], name: "index_profiles_on_age_id"
    t.index ["country_id"], name: "index_profiles_on_country_id"
    t.index ["disease_id"], name: "index_profiles_on_disease_id"
    t.index ["month_id"], name: "index_profiles_on_month_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
    t.index ["year_id"], name: "index_profiles_on_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "suspended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  create_table "years", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "profiles", "ages"
  add_foreign_key "profiles", "countries"
  add_foreign_key "profiles", "diseases"
  add_foreign_key "profiles", "months"
  add_foreign_key "profiles", "users"
  add_foreign_key "profiles", "years"
end
