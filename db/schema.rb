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

ActiveRecord::Schema[8.0].define(version: 2025_08_17_014433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "api_keys", force: :cascade do |t|
    t.integer "user_id"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "car_brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_fuelings", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "filled_at"
    t.integer "price"
    t.integer "km"
    t.integer "ron_number"
    t.string "location"
    t.integer "fuel_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "volume", precision: 8, scale: 2
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
    t.string "title"
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

  create_table "car_shops", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "google_map_url"
    t.datetime "approved_at"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "lat"
    t.string "lng"
    t.string "company_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "car_model_id"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "image_data"
    t.string "company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "plan", default: "free"
    t.datetime "paid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_loggers", force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.string "status"
    t.string "token"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_logs", force: :cascade do |t|
    t.integer "device_logger_id"
    t.string "type"
    t.jsonb "raw", default: {}
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

  create_table "maintenance_settings", force: :cascade do |t|
    t.integer "car_id"
    t.integer "engine_oil_change_interval", default: 5000
    t.integer "engine_oil_change_time_interval", default: 6
    t.integer "transmission_oil_change_interval", default: 20000
    t.integer "transmission_oil_change_time_interval", default: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_number"
    t.decimal "price", precision: 12, scale: 2
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "midtrans_redirect_url"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.jsonb "image_data"
    t.integer "company_id"
    t.boolean "owner", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
