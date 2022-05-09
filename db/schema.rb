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

ActiveRecord::Schema[7.0].define(version: 2022_05_09_175702) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "future_address"
    t.string "cell_phone"
  end

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "crew"
    t.string "division"
    t.float "man_hours_per_week", default: 40.0
    t.decimal "man_hours_per_month", default: "0.0"
    t.decimal "man_hours_three_months", default: "0.0"
    t.decimal "man_hours_six_months", default: "0.0"
    t.decimal "man_hours_nine_months", default: "0.0"
    t.decimal "man_hours_twelve_months", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "true_man_hours_per_week"
    t.string "role"
    t.string "email"
    t.string "phone_number"
    t.integer "tier"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "crew"
    t.decimal "man_hours", precision: 15, scale: 2, null: false
    t.string "phase"
    t.string "division"
    t.decimal "total_cost", default: "0.0", null: false
    t.decimal "sub_cost", default: "0.0", null: false
    t.decimal "hours_per_week", precision: 15, scale: 2, null: false
    t.decimal "weeks", precision: 15, scale: 2, null: false
    t.decimal "week_remaining", precision: 15, scale: 2, null: false
    t.decimal "hours_remaining", precision: 15, scale: 2, null: false
    t.decimal "three_month_hours", precision: 15, scale: 2, null: false
    t.decimal "six_month_hours", precision: 15, scale: 2, null: false
    t.decimal "nine_month_hours", precision: 15, scale: 2, null: false
    t.decimal "twelve_month_hours", precision: 15, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_manager"
    t.decimal "actual_worked_hours", default: "0.0"
    t.decimal "e_rating", default: "0.0"
    t.boolean "completed", default: false
    t.bigint "project_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "project_manager"
    t.string "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "info"
    t.decimal "cost"
    t.decimal "sub_cost"
    t.date "start_date"
    t.date "end_date"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
