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

ActiveRecord::Schema[8.1].define(version: 2026_01_06_031907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "api_key"
    t.string "company_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "car_brands", force: :cascade do |t|
    t.datetime "created"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated"
    t.datetime "updated_at", null: false
  end

  create_table "car_fuelings", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.integer "distance"
    t.datetime "filled_at"
    t.string "location"
    t.integer "price"
    t.integer "ron_number"
    t.datetime "updated_at", null: false
    t.decimal "volume", precision: 8, scale: 2
  end

  create_table "car_maintenances", force: :cascade do |t|
    t.integer "car_id"
    t.integer "car_shop_id"
    t.datetime "created"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "maintenance_type"
    t.datetime "performed_at"
    t.string "title"
    t.string "token"
    t.datetime "updated"
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.integer "car_brand_id"
    t.datetime "created"
    t.datetime "created_at", null: false
    t.string "model"
    t.integer "overall_height"
    t.integer "overall_length"
    t.integer "overall_width"
    t.integer "tank_capacity"
    t.datetime "updated"
    t.datetime "updated_at", null: false
    t.integer "wheelbase"
    t.integer "year"
  end

  create_table "car_sell_images", force: :cascade do |t|
    t.integer "car_sell_id"
    t.datetime "created_at", null: false
    t.jsonb "image_data"
    t.integer "position", default: 0
    t.datetime "updated_at", null: false
  end

  create_table "car_sells", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "district_id"
    t.string "phone"
    t.decimal "price", precision: 15, scale: 2
    t.integer "province_id"
    t.integer "regency_id"
    t.boolean "show_service_history", default: false
    t.string "status"
    t.string "token", null: false
    t.datetime "updated_at", null: false
    t.integer "village_id"
    t.index ["token"], name: "index_car_sells_on_token"
  end

  create_table "car_shops", force: :cascade do |t|
    t.text "address"
    t.datetime "approved_at"
    t.string "category"
    t.string "company_id"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "google_map_url"
    t.string "lat"
    t.string "lng"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer "car_model_id"
    t.string "company_id"
    t.datetime "created"
    t.datetime "created_at", null: false
    t.jsonb "image_data"
    t.string "name"
    t.datetime "updated"
    t.datetime "updated_at", null: false
    t.integer "year"
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "paid_until"
    t.string "plan", default: "free"
    t.datetime "updated_at", null: false
  end

  create_table "device_loggers", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "status"
    t.string "token"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "device_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "device_logger_id"
    t.jsonb "raw", default: {}
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "regency_id"
    t.datetime "updated_at", null: false
    t.index ["regency_id"], name: "index_districts_on_regency_id"
  end

  create_table "history_images", force: :cascade do |t|
    t.integer "car_maintenance_id"
    t.datetime "created_at", null: false
    t.jsonb "image_data"
    t.string "title"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_reports", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.jsonb "pdf_data"
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_settings", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.integer "engine_oil_change_interval", default: 5000
    t.integer "engine_oil_change_time_interval", default: 6
    t.integer "transmission_oil_change_interval", default: 20000
    t.integer "transmission_oil_change_time_interval", default: 24
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.string "midtrans_redirect_url"
    t.integer "order_number"
    t.decimal "price", precision: 12, scale: 2
    t.string "status", default: "pending"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "regencies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "province_id"
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_regencies_on_province_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.integer "company_id"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.jsonb "image_data"
    t.string "language"
    t.boolean "owner", default: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "timezone"
    t.string "unconfirmed_email"
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "villages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "district_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_villages_on_district_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "districts", "regencies"
  add_foreign_key "regencies", "provinces"
  add_foreign_key "villages", "districts"
end
