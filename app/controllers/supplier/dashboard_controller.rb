class Supplier::DashboardController < Supplier::ApplicationController


  def index
    @latest_fuel_price = current_user.fuel_prices.last
    @texts = current_user.pricerockets.where('created_at >= ? and created_at <= ?', Time.now.beginning_of_month, Time.now.end_of_month)
    @prev_texts = 200
  end


end
