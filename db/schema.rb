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

ActiveRecord::Schema[7.0].define(version: 2022_07_21_201318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "account_name"
    t.string "description"
    t.decimal "income"
    t.decimal "balance"
    t.decimal "expenses"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.bigint "division_id", default: 0
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "utilization", default: 0
    t.bigint "crew_id"
    t.bigint "job_id"
    t.index ["crew_id"], name: "index_divisions_on_crew_id"
    t.index ["job_id"], name: "index_divisions_on_job_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "crew_name"
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
    t.string "position"
    t.string "email"
    t.string "phone_number"
    t.integer "tier"
    t.bigint "crew_id"
    t.bigint "position_id"
    t.index ["crew_id"], name: "index_employees_on_crew_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "year", null: false
    t.string "month", null: false
    t.decimal "total_cost", null: false
    t.decimal "total_sub_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "crew_name"
    t.decimal "man_hours", precision: 15, scale: 2, null: false
    t.string "phase"
    t.string "division_name"
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
    t.decimal "actual_worked_hours", default: "0.0"
    t.decimal "e_rating", default: "0.0"
    t.boolean "completed", default: false
    t.bigint "project_id"
    t.bigint "crew_id"
    t.bigint "division_id"
    t.index ["crew_id"], name: "index_jobs_on_crew_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "pm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "project_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "info"
    t.decimal "cost", default: "0.0"
    t.decimal "sub_cost", default: "0.0"
    t.date "start_date"
    t.date "end_date"
    t.bigint "client_id"
    t.float "number_of_days", default: 0.0, null: false
    t.decimal "sub_cost_per_day", default: "0.0", null: false
    t.decimal "project_cost_per_day", default: "0.0", null: false
    t.decimal "total_cost_per_day", default: "0.0", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "variances", force: :cascade do |t|
    t.decimal "variance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "users", "roles"
end
