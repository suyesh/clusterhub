class Supplier::MassSendController < Supplier::ApplicationController
  before_action :set_twilio, only: [:mass_send_texts]

  def index
    @texts = current_user.pricerockets.where(status: 0)
  end

  def mass_send_texts
  end
private
def send_message(contact)

  @client.messages.create(
    from: '+18482299159',
    to: contact.cell_number,
    body: "Hey there! #{contact.first_name}. #{supplier.first_name} from #{supplier.business_name} just updated the Gas price for today. Regular: $#{contact.retail_prices.last.r_regular}, Medium: $#{contact.retail_prices.last.r_medium},Premium: $#{contact.retail_prices.last.r_premium}, Diesel: $#{contact.retail_prices.last.r_diesel}"
  )
end

def set_twilio
  require 'twilio-ruby'
  @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
end
end
