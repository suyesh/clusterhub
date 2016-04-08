# create_table "contacts", force: :cascade do |t|
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
# end

class Contact < ActiveRecord::Base
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Oops! Looks like the email you provided is not valid. Please fix and resubmit the form.'
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :cell_number
  validates_presence_of :c_regular
  validates_presence_of :c_medium
  validates_presence_of :c_premium
  validates_presence_of :c_diesel
  validates_presence_of :c_delivery
  after_save :send_message
  belongs_to :supplier, class_name: 'User'
  has_many :retail_prices
  has_many :price_rockets

  private

  def send_message
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    unless supplier.fuel_prices.empty?
      retail_prices.create(r_regular: supplier.fuel_prices.last.regular + c_regular,
                           r_medium: supplier.fuel_prices.last.medium + c_medium,
                           r_premium: supplier.fuel_prices.last.premium + c_premium,
                           r_diesel: supplier.fuel_prices.last.diesel + c_diesel
                          )

      supplier.pricerockets.create(to: cell_number, body: "Hey there! #{first_name}. #{supplier.first_name} from #{supplier.business_name} just added you to their contacts at petrohub. Regular: $#{retail_prices.last.r_regular}, Medium: $#{retail_prices.last.r_medium},Premium: $#{retail_prices.last.r_premium}, Diesel: $#{retail_prices.last.r_diesel}")
      @client.messages.create(
        from: '+18482299159',
        to: cell_number,
        body: "Hey there! #{first_name}. This message is from PetroHub on behalf of #{supplier.first_name} from #{supplier.business_name}. Their current FuelPrice is as follows, Regular: $#{retail_prices.last.r_regular}, Medium: $#{retail_prices.last.r_medium},Premium: $#{retail_prices.last.r_premium}, Diesel: $#{retail_prices.last.r_diesel}"
      )
    end
  end
end
