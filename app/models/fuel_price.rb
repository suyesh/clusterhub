#create_table "fuel_prices", force: :cascade do |t|
#  t.decimal  "regular"
#  t.decimal  "medium"
#  t.decimal  "premium"
#  t.decimal  "diesel"
#  t.integer  "supplier_id"
#  t.datetime "created_at",  null: false
#  t.datetime "updated_at",  null: false
#end

class FuelPrice < ActiveRecord::Base
  belongs_to :supplier, class_name: "User"
end
