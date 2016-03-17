# create_table "users", force: :cascade do |t|
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
# end

# add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true, using: :btree
# add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
# add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree
# add_index "users", ["tax_id"], name: "index_users_on_tax_id", unique: true, using: :btree

# end

class User < ActiveRecord::Base
  # before_save :generate_account_number, on: [:create]
  authenticates_with_sorcery!
  validates_confirmation_of :password
  validates_presence_of :password,{on: :create,message: "Please provide password and password confirmation."}
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email,{:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Oops! Looks like the email you provided is not valid. Please fix and resubmit the form."}
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :business_name
  validates_presence_of :phone_number
  validates_presence_of :cell_number
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :tax_id
  validates_presence_of :ssn
  validates_presence_of :terms, {terms: 1,message: "You have to agree to our terms and conditions."}

  enum role: [:pending, :retailer, :supplier, :trucking, :admin]
  enum status: [:inactive,:active, :denied, :archived]



  # validate :account_number_check

  # def generate_account_number
  #   randomly generated
  # end

  # private

  # do a custum validator

  # def account_number_check
  #   if User.find_by(account_number: the_account_number)
  #    SecureRandom.hex(2)
  # end
  # end
end
