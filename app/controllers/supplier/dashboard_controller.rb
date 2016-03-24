class Supplier::DashboardController < Supplier::ApplicationController

  before_action :set_supplier
  def index
    @latest_fuel_price = @supplier.fuel_prices.last
  end

private
def set_supplier
  @supplier = User.find_by(params[:supplier_id])
end
end
