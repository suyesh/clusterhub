# create_table "fuel_prices", force: :cascade do |t|
#  t.decimal  "regular"
#  t.decimal  "medium"
#  t.decimal  "premium"
#  t.decimal  "diesel"
#  t.integer  "supplier_id"
#  t.datetime "created_at",  null: false
#  t.datetime "updated_at",  null: false
# end

class FuelPrice < ActiveRecord::Base
  validates_presence_of :regular
  validates_presence_of :medium
  validates_presence_of :premium
  validates_presence_of :diesel
  after_save :create_contact_price
  belongs_to :supplier, class_name: 'User'
  belongs_to :retail_price



  def create_contact_price
    unless supplier.contacts.empty?
      supplier.contacts.each do |contact|
        contact.retail_prices.create(r_regular: supplier.fuel_prices.last.regular + contact.c_regular,
                                     r_medium: supplier.fuel_prices.last.medium + contact.c_medium,
                                     r_premium: supplier.fuel_prices.last.premium + contact.c_premium,
                                     r_diesel: supplier.fuel_prices.last.diesel + contact.c_diesel
                                    )
        supplier.pricerockets.create(status: :not_sent, to: contact.cell_number, body: "Hey there! #{contact.first_name}. #{supplier.first_name} from #{supplier.business_name} just updated the Gas price for today. Regular: $#{contact.retail_prices.last.r_regular}, Medium: $#{contact.retail_prices.last.r_medium},Premium: $#{contact.retail_prices.last.r_premium}, Diesel: $#{contact.retail_prices.last.r_diesel}")
      end
   end
  end
end
