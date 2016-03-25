class Supplier::DashboardController < Supplier::ApplicationController


  def index
    @latest_fuel_price = current_user.fuel_prices.last
  end


end
