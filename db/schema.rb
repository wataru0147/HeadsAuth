# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160725025804) do

  create_table "appointments", force: :cascade do |t|
    t.date     "date"
    t.string   "hour"
    t.string   "minute"
    t.boolean  "approved",       default: false
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "contact_number"
    t.text     "note"
  end

  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categorizations", ["appointment_id"], name: "index_categorizations_on_appointment_id"
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "brand_id"
    t.boolean  "published"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "product_image_file_name"
    t.string   "product_image_content_type"
    t.integer  "product_image_file_size"
    t.datetime "product_image_updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "guest"
    t.boolean  "admin",             default: false
    t.boolean  "staff",             default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

end
