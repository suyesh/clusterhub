class Supplier::MassSendController < Supplier::ApplicationController
  before_action :set_twilio, only: [:mass_send_texts]

  def index
    @texts = current_user.pricerockets.where(status: 0)
  end

  def mass_send_texts
    @texts = current_user.pricerockets.where(status: 0)
    @texts.all do |text|
      @client.messages.create(
        from: '+18482299159',
        to: text.to,
        body: "Hey there! #{find_contact(text.to).first_name}. #{current_user.first_name} from #{current.business_name} just updated the Gas price for today. Regular: $#{find_contact(text.to).retail_prices.last.r_regular}, Medium: $#{find_contact(text.to).retail_prices.last.r_medium},Premium: $#{find_contact(text.to).retail_prices.last.r_premium}, Diesel: $#{find_contact(text.to).retail_prices.last.r_diesel}"
      )
      text.sent!
    end
    redirect_to supplier_mass_send_index_path
  end


private

def find_contact(phone)
  @contact = current_user.contacts.find_by(cell_number: phone)
end

def set_twilio
  require 'twilio-ruby'
  @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
end
end
