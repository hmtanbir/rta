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

ActiveRecord::Schema.define(version: 2020_02_16_031554) do

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

  create_view "profile_data", materialized: true, sql_definition: <<-SQL
      WITH ages AS (
           SELECT DISTINCT ages_1.id,
              ages_1.range
             FROM public.ages ages_1
          ), countries AS (
           SELECT DISTINCT countries_1.id,
              countries_1.name AS country_name,
              countries_1.code AS country_code
             FROM public.countries countries_1
          ), diseases AS (
           SELECT DISTINCT diseases_1.id,
              diseases_1.name AS disease_name
             FROM public.diseases diseases_1
          ), years AS (
           SELECT DISTINCT years_1.id,
              years_1.year
             FROM public.years years_1
          ), months AS (
           SELECT DISTINCT months_1.id,
              months_1.name AS month_name,
              months_1.code AS month_code
             FROM public.months months_1
          ), users AS (
           SELECT DISTINCT users_1.id,
              users_1.name AS user_name,
              users_1.email,
              users_1.status,
              users_1.deleted_at,
              users_1.suspended_at
             FROM public.users users_1
          )
   SELECT profiles.id,
      max((users.user_name)::text) AS user_name,
      max((users.email)::text) AS email,
          CASE
              WHEN (max(users.status) = 0) THEN 'active'::text
              ELSE
              CASE
                  WHEN (max(users.status) = 1) THEN 'suspended'::text
                  ELSE 'deleted'::text
              END
          END AS status,
      max(users.deleted_at) AS user_deleted_at,
      max(users.suspended_at) AS user_suspended_at,
          CASE
              WHEN (profiles.gender > 0) THEN 'female'::text
              ELSE 'male'::text
          END AS gender,
          CASE
              WHEN (profiles.profile_type > 0) THEN 'carer'::text
              ELSE 'patient'::text
          END AS profile_type,
      max((ages.range)::text) AS age_range,
      max((countries.country_name)::text) AS country_name,
      max((countries.country_code)::text) AS country_code,
      max((diseases.disease_name)::text) AS disease_name,
      max((years.year)::text) AS year,
      max((months.month_name)::text) AS month_name,
      max((months.month_code)::text) AS month_code,
      max(profiles.created_at) AS profile_created_at,
      max(profiles.updated_at) AS profile_updated_at
     FROM ((((((profiles
       LEFT JOIN ages ON ((ages.id = profiles.age_id)))
       LEFT JOIN countries ON ((countries.id = profiles.country_id)))
       LEFT JOIN diseases ON ((diseases.id = profiles.disease_id)))
       LEFT JOIN months ON ((months.id = profiles.month_id)))
       LEFT JOIN users ON ((users.id = profiles.user_id)))
       LEFT JOIN years ON ((years.id = profiles.year_id)))
    GROUP BY profiles.id
    ORDER BY profiles.id;
  SQL
  add_index "profile_data", ["id"], name: "index_profile_data_on_id", unique: true

end
