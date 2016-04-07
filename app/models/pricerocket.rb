class Pricerocket < ActiveRecord::Base

  after_save :send_message
  belongs_to :supplier, class_name: "User"



  def send_message
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    @client.messages.create(
      from: '+18482299159',
      to: supplier.pricerockets.last.to,
      body: supplier.pricerockets.last.body
    )
  end

end
