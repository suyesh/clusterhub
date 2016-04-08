class Supplier::DashboardController < Supplier::ApplicationController
  def index
    @latest_fuel_price = current_user.fuel_prices.last
    last_month = Time.zone.now - 1.month
    @texts = current_user.pricerockets.where('created_at >= ? and created_at <= ?', Time.now.beginning_of_month, Time.now.end_of_month)
    @prev_texts = current_user.pricerockets.where('created_at >= ? and created_at <= ?', last_month.beginning_of_month, last_month.end_of_month)
  end
end
