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

ActiveRecord::Schema[8.0].define(version: 2025_05_05_124631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "car_brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_maintenances", force: :cascade do |t|
    t.integer "car_id"
    t.string "maintenance_type"
    t.text "description"
    t.datetime "performed_at"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "model"
    t.integer "year"
    t.datetime "created"
    t.datetime "updated"
    t.integer "car_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "overall_width"
    t.integer "overall_height"
    t.integer "overall_length"
    t.integer "wheelbase"
    t.integer "tank_capacity"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "year"
    t.integer "car_model_id"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_images", force: :cascade do |t|
    t.integer "car_maintenance_id"
    t.string "type"
    t.string "title"
    t.jsonb "image_data"
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
    t.boolean "admin", default: false
    t.string "plan", default: "free"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
