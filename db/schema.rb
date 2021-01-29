# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_29_170057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "license_number", default: "", null: false
    t.integer "age"
    t.string "occupation", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventory_restocks", force: :cascade do |t|
    t.bigint "part_supplier_id", null: false
    t.bigint "part_inventory_id", null: false
    t.integer "restock_count"
    t.integer "price_per_piece_cents", default: 0, null: false
    t.string "price_per_piece_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_inventory_id"], name: "index_inventory_restocks_on_part_inventory_id"
    t.index ["part_supplier_id"], name: "index_inventory_restocks_on_part_supplier_id"
  end

  create_table "inventory_suppliers", force: :cascade do |t|
    t.bigint "part_supplier_id", null: false
    t.bigint "part_inventory_id", null: false
    t.string "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_inventory_id"], name: "index_inventory_suppliers_on_part_inventory_id"
    t.index ["part_supplier_id"], name: "index_inventory_suppliers_on_part_supplier_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "customer_id", null: false
    t.string "car_model", default: "", null: false
    t.string "mileage", default: "0", null: false
    t.boolean "active", default: true
    t.string "problem"
    t.string "work_done_description", default: ""
    t.integer "total_job_cents", default: 0, null: false
    t.string "total_job_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "labour_jobs", force: :cascade do |t|
    t.string "description"
    t.integer "cost_cents", default: 0, null: false
    t.string "cost_currency", default: "USD", null: false
    t.datetime "expected_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_labours", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "labour_job_id", null: false
    t.bigint "mechanic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_line_labours_on_job_id"
    t.index ["labour_job_id"], name: "index_line_labours_on_labour_job_id"
    t.index ["mechanic_id"], name: "index_line_labours_on_mechanic_id"
  end

  create_table "line_parts", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "part_inventory_id", null: false
    t.integer "quantity"
    t.integer "total_price_parts_cents", default: 0, null: false
    t.string "total_price_parts_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_line_parts_on_job_id"
    t.index ["part_inventory_id"], name: "index_line_parts_on_part_inventory_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "salary_cents", default: 0, null: false
    t.string "salary_currency", default: "USD", null: false
    t.string "national_id_number", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "part_inventories", force: :cascade do |t|
    t.string "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "selling_price_cents", default: 0, null: false
    t.string "selling_price_currency", default: "USD", null: false
    t.string "brand_name"
    t.integer "stock_count"
    t.integer "trigger_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "part_suppliers", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_address"
    t.string "vendor_number"
    t.bigint "part_inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_inventory_id"], name: "index_part_suppliers_on_part_inventory_id"
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
    t.boolean "admin", default: false
    t.boolean "staff", default: true
    t.integer "salary_cents", default: 0, null: false
    t.string "salary_currency", default: "USD", null: false
    t.string "address", default: "", null: false
    t.string "role", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventory_restocks", "part_inventories"
  add_foreign_key "inventory_restocks", "part_suppliers"
  add_foreign_key "inventory_suppliers", "part_inventories"
  add_foreign_key "inventory_suppliers", "part_suppliers"
  add_foreign_key "jobs", "customers"
  add_foreign_key "jobs", "users"
  add_foreign_key "line_labours", "jobs"
  add_foreign_key "line_labours", "labour_jobs"
  add_foreign_key "line_labours", "mechanics"
  add_foreign_key "line_parts", "jobs"
  add_foreign_key "line_parts", "part_inventories"
  add_foreign_key "part_suppliers", "part_inventories"
end
