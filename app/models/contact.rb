class Contact < ActiveRecord::Base
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Oops! Looks like the email you provided is not valid. Please fix and resubmit the form.'
    validates_presence_of :first_name
    validates_presence_of :email
    validates_presence_of :last_name
    validates_presence_of :cell_number
    belongs_to :supplier, class_name: 'User'
    has_many :retail_prices
    has_many :price_rockets

    private

    def send_message
        require 'twilio-ruby'
        @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
        # unless supplier.fuel_prices.empty?
        #    retail_prices.create(r_regular: supplier.fuel_prices.last.regular + c_regular,
        # r_medium: supplier.fuel_prices.last.medium + c_medium,
        # r_premium: supplier.fuel_prices.last.premium + c_premium,
        # r_diesel: supplier.fuel_prices.last.diesel + c_diesel
        #  )

        #  supplier.pricerockets.create(to: cell_number, body: "Hey there! #{first_name}. #{supplier.first_name} from #{supplier.business_name} just added you to their contacts at petrohub. Regular: $#{retail_prices.last.r_regular}, Medium: $#{retail_prices.last.r_medium},Premium: $#{retail_prices.last.r_premium}, Diesel: $#{retail_prices.last.r_diesel}")
        #  @client.messages.create(
        #  from: '+18482299159',
        #      to: cell_number,
        #      body: "Hey there! #{first_name}. This message is from PetroHub on behalf of #{supplier.first_name} from #{supplier.business_name}. Their current FuelPrice is as follows, Regular: $#{retail_prices.last.r_regular}, Medium: $#{retail_prices.last.r_medium},Premium: $#{retail_prices.last.r_premium}, Diesel: $#{retail_prices.last.r_diesel}"
        #  )
        # end
    end
end
