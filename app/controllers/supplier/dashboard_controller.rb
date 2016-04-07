class Supplier::DashboardController < Supplier::ApplicationController


  def index
    @latest_fuel_price = current_user.fuel_prices.last
    @texts = 750.00 #current_user.texts.all()
  end


end
