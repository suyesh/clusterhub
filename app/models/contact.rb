#create_table "contacts", force: :cascade do |t|
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
#  t.string   "in_biz"
#  t.integer  "supplier_id"
#  t.decimal  "c_regular"
#  t.decimal  "c_medium"
#  t.decimal  "c_premium"
#  t.decimal  "c_diesel"
#  t.decimal  "c_delivery"
#  t.datetime "created_at",     null: false
#  t.datetime "updated_at",     null: false
#end



class Contact < ActiveRecord::Base
  belongs_to :supplier, class_name: "User"
  has_one :retail_price
end
