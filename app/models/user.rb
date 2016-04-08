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
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes['password'] }
  validates :password, confirmation: true, if: -> { new_record? || changes['password'] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes['password'] }
  validates :email, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Oops! Looks like the email you provided is not valid. Please fix and resubmit the form.'
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :business_name
  validates_presence_of :phone_number
  validates_presence_of :cell_number
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  #validates :tax_id, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
  #validates :ssn, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
  validates_presence_of :terms, terms: 1, message: 'You have to agree to our terms and conditions.'

  enum role: [:pending, :retailer, :supplier, :trucking, :admin]
  enum status: [:inactive, :active, :denied, :archived]

  has_many :stations
  has_many :formulas
  has_many :fuel_prices,foreign_key: :supplier_id
  has_many :contacts, foreign_key: :supplier_id
  has_many :retail_prices, foreign_key: :contact_id
  has_many :pricerockets, foreign_key: :supplier_id
  

end

#belongs_to :contact, class_name: 'User' # contact_id integer
#belongs_to :supplier, class_name: 'User' # supplier_id integer
