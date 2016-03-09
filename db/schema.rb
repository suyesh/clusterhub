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

ActiveRecord::Schema.define(version: 20160309172759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                    null: false
    t.string   "username"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "tax_identification"
    t.string   "ssn"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "state"
    t.string   "account_type"
    t.string   "y_in_biz"
    t.string   "account_number"
    t.integer  "account_status",               default: 0
    t.integer  "user_kind",                    default: 0
  end

  add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree
  add_index "users", ["tax_identification"], name: "index_users_on_tax_identification", unique: true, using: :btree

end
