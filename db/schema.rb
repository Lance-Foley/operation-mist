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

ActiveRecord::Schema[7.0].define(version: 2022_04_21_163529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.float "contracted_hours_per_week"
    t.float "available_hours_per_week"
    t.float "contracted_hours_per_month"
    t.float "available_hours_per_month"
    t.float "contracted_hours_three_months"
    t.float "available_hours_three_months"
    t.float "contracted_hours_six_months"
    t.float "available_hours_six_months"
    t.float "contracted_hours_nine_months"
    t.float "available_hours_nine_months"
    t.float "contracted_hours_twelve_months"
    t.float "available_hours_twelve_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.float "hours_per_week"
    t.float "hours_per_month"
    t.float "three_month_hours"
    t.float "six_month_hours"
    t.float "nine_month_hours"
    t.float "twelve_month_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "crew"
    t.string "division"
    t.float "man_hours_per_week"
    t.float "man_hours_per_month"
    t.float "man_hours_three_months"
    t.float "man_hours_six_months"
    t.float "man_hours_nine_months"
    t.float "man_hours_twelve_months"
    t.float "contr_hours_per_week"
    t.float "contr_hour_per_month"
    t.float "contr_hours_three_months"
    t.float "contr_hours_nine_months"
    t.float "contr_hours_twelve_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "true_man_hours_per_week"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "crew"
    t.decimal "man_hours", precision: 15, scale: 2, null: false
    t.string "phase"
    t.string "division"
    t.decimal "total_cost", precision: 15, scale: 2, null: false
    t.decimal "sub_cost", precision: 15, scale: 2, null: false
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
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.float "hours_per_week"
    t.float "hours_per_month"
    t.float "three_month_hours"
    t.float "six_month_hours"
    t.float "nine_month_hours"
    t.float "twelve_month_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
