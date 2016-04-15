class FuelPrice < ActiveRecord::Base
    after_save :send_slack
    validates :fuel_products, presence: true
    belongs_to :supplier, class_name: 'User'
    has_many :fuel_products
    accepts_nested_attributes_for :fuel_products, allow_destroy: true

    private

    def all_products
      products = []
        self.fuel_products.each do |product|
          products << product.fuel + " " + ":" + " " + "$"+product.price.to_s
        end
        products
    end

    def send_slack
        require 'slack-ruby-client'
        Slack.configure do |config|
            config.token = ENV['SLACK_API_TOKEN']
        end
        @slack = Slack::Web::Client.new
        @slack.chat_postMessage(channel: '#latest_prices', text: "#{self.created_at.strftime('%F')} - #{supplier.first_name} from #{supplier.business_name} just updated the Fuel Prices. #{all_products} ", as_user: true)
    end
end
