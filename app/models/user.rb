# create_table "users", force: :cascade do |t|
#  t.string   "email",                                    null: false
#  t.string   "username"
#  t.string   "crypted_password"
#  t.string   "salt"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.string   "remember_me_token"
#  t.datetime "remember_me_token_expires_at"
#  t.string   "first_name"
#  t.string   "last_name"
#  t.string   "business_name"
#  t.string   "phone_number"
#  t.string   "cell_number"
#  t.string   "tax_identification"
#  t.string   "ssn"
#  t.string   "address"
#  t.string   "city"
#  t.string   "zip_code"
#  t.string   "state"
#  t.string   "account_type"
#  t.string   "y_in_biz"
#  t.string   "account_number"
#  t.integer  "account_status",               default: 0
#  t.integer  "user_kind",                    default: 0
# end

# add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true, using: :btree
# add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
# add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
# add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree
# add_index "users", ["tax_identification"], name: "index_users_on_tax_identification", unique: true, using: :btree

# end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :first_name,
            :last_name,
            :business_name,
            :phone_number,
            :cell_number,
            :tax_identification,
            :ssn,
            :address,
            :city,
            :state,
            :zip_code,
            :account_type,
            :y_in_biz,
            :email,
            presence: true
  validates_confirmation_of :password
  validates :password, presence: true, length: { minimum: 6 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  enum account_status: [:pending, :approved, :disabled]
  enum user_kind: [:unsure, :retailer, :supplier, :trucking, :admin]
end
