class Supplier::FuelPricesController < Supplier::ApplicationController
  before_action :set_fuel_price, only: [:edit, :update]
  before_action :set_twilio, only: [:create, :update]
  before_action :set_slack, only: [:create, :update]

  def index
    @fuel_prices = current_user.fuel_prices.all.order('created_at DESC')
    @latest_fuel_price = current_user.fuel_prices.last
  end

  def new
    @fuel_price = current_user.fuel_prices.build
  end

  def create
    @fuel_price = current_user.fuel_prices.build(fuel_price_params)
    if @fuel_price.save
      unless current_user.contacts.empty?
        current_user.contacts.each do |contact|
          contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + contact.c_regular,
                                       r_medium: current_user.fuel_prices.last.medium + contact.c_medium,
                                       r_premium: current_user.fuel_prices.last.premium + contact.c_premium,
                                       r_diesel: current_user.fuel_prices.last.diesel + contact.c_diesel
                                      )
          current_user.pricerockets.create(to: contact.cell_number, body: "Hey there! #{contact.first_name}. #{current_user.first_name} from #{current_user.business_name} just updated the Gas price for today. Regular: $#{contact.retail_prices.last.r_regular}, Medium: $#{contact.retail_prices.last.r_medium},Premium: $#{contact.retail_prices.last.r_premium}, Diesel: $#{contact.retail_prices.last.r_diesel}"  )
        end
      end
      @slack.chat_postMessage(channel: '#latest_prices', text: "#{@fuel_price.created_at.strftime('%F')} - #{current_user.first_name} from #{current_user.business_name} just updated the Fuel Price. Regular: $#{current_user.fuel_prices.last.regular}, Medium: $#{current_user.fuel_prices.last.medium}, Premium: $#{current_user.fuel_prices.last.premium}, Diesel: $#{current_user.fuel_prices.last.diesel} ", as_user: true)
      flash[:notice] = "You have successfully Added new Fuel Price. Petrohub sent out #{current_user.contacts.count} Text messages with updated price to your #{current_user.contacts.count} retailers."
      redirect_to supplier_fuel_prices_path
    else
      flash.now[:alert] = 'Something went wrong. Please try again.'
      render 'new'
   end
  end

  def edit
  end

  def update
    if @fuel_price.update(fuel_price_params)
      unless current_user.contacts.empty?
        current_user.contacts.each do |contact|
          contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + contact.c_regular,
                                       r_medium: current_user.fuel_prices.last.medium + contact.c_medium,
                                       r_premium: current_user.fuel_prices.last.premium + contact.c_premium,
                                       r_diesel: current_user.fuel_prices.last.diesel + contact.c_diesel
                                      )
          current_user.pricerockets.create(to: contact.cell_number, body: "Hey there! #{contact.first_name}. #{current_user.first_name} from #{current_user.business_name} just updated the Gas price for today. Regular: $#{contact.retail_prices.last.r_regular}, Medium: $#{contact.retail_prices.last.r_medium},Premium: $#{contact.retail_prices.last.r_premium}, Diesel: $#{contact.retail_prices.last.r_diesel}"  )
          # TODO: what happens if there is an error sending a message?

          # current_user.sent_messages << Messages.new(to: "+1#{contact.cell_number}")

          # User.find(1).messages_sent(month, year)

          # def messages_sent(month, year)
          #   beginning_of_month = Date.new(....).beggining_of_the_month
          #   end_of_the_month = ...
          # search rails api for DateAndTime::Calculations
          #   self.find(1).where("created_at > ? and created_at <= ?", beginning_of_month, end_of_month").count
          # end
        end
      end
      @slack.chat_postMessage(channel: '#latest_prices', text: "#{@fuel_price.updated_at.strftime('%F')} - #{current_user.first_name} from #{current_user.business_name} just updated the Fuel Price. Regular: $#{current_user.fuel_prices.last.regular}, Medium: $#{current_user.fuel_prices.last.medium}, Premium: $#{current_user.fuel_prices.last.premium}, Diesel: $#{current_user.fuel_prices.last.diesel} ", as_user: true)
      flash[:notice] = 'Fuel Price has been successfully updated. And we sent out Text mesagges with updated price to #{current_user.contacts.count} retailers.'
      redirect_to supplier_fuel_prices_path
    else
      flash.now[:alert] = 'Something went wrong. Please try again'
      render 'edit'
    end
  end

  private

  def set_slack
    require 'slack-ruby-client'
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
    @slack = Slack::Web::Client.new
  end

  def set_twilio
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
  end

  def fuel_price_params
    params.require(:fuel_price).permit(:regular, :medium, :premium, :diesel)
  end

  def set_fuel_price
    @fuel_price = FuelPrice.find(params[:id])
  end
end
