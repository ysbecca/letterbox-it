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

ActiveRecord::Schema.define(version: 20170105095456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distributions", force: :cascade do |t|
    t.date     "date"
    t.integer  "participants"
    t.jsonb    "routes"
    t.text     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "quantity"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
  end

  create_table "regions_users", id: false, force: :cascade do |t|
    t.integer "region_id"
    t.integer "user_id"
    t.boolean "approved"
    t.date    "approval_date"
    t.integer "admin_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "default_map_centre"
    t.boolean  "is_super_admin"
    t.boolean  "is_admin"
    t.integer  "region_id"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["region_id"], name: "index_users_on_region_id", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

end
