#create_table "users", force: :cascade do |t|
#  t.string   "email",                        null: false
#  t.string   "crypted_password"
#  t.string   "salt"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.string   "first_name"
#  t.string   "last_name"
#  t.string   "business_name"
#  t.string   "phone_number"
#  t.string   "cell_number"
#  t.string   "street_address"
#  t.string   "apt_suite"
#  t.string   "city"
#  t.string   "state"
#  t.string   "zip_code"
#  t.string   "tax_id"
#  t.string   "ssn"
#  t.string   "account_number"
#  t.string   "in_biz"
#  t.integer  "role",             default: 0
#  t.integer  "status",           default: 0
#end

#add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true, using: :btree
#add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
#add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree
#add_index "users", ["tax_id"], name: "index_users_on_tax_id", unique: true, using: :btree

#end


class User < ActiveRecord::Base
  #before_save :generate_account_number, on: [:create]
  authenticates_with_sorcery!
  validates_confirmation_of :password

  enum role: [:reviewed,:retailer, :supplier, :trucking, :admin]
  enum status: [:active, :denied, :archived, :inactive]

  # validate :account_number_check

  # def generate_account_number
  #   randomly generated
  # end

  #private

  # do a custum validator

  # def account_number_check
  #   if User.find_by(account_number: the_account_number)
  #    SecureRandom.hex(2)
  # end
  #end
end
