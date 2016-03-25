class Supplier::FuelPricesController < Supplier::ApplicationController
  #before_action :set_supplier

  def index
    @fuel_prices = current_user.fuel_prices.all.order("created_at DESC")
    @latest_fuel_price = current_user.fuel_prices.last
  end

  def new
    @fuel_price = current_user.fuel_prices.build
  end

  def create
    @fuel_price = current_user.fuel_prices.build(fuel_price_params)
    if @fuel_price.save
      flash[:notice] = "You have successfully Added new Fuel Price."
      redirect_to supplier_fuel_prices_path
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render "new"

    end
  end

  private

  def fuel_price_params
    params.require(:fuel_price).permit(:regular, :medium, :premium, :diesel)
  end

  #def set_supplier
    #@supplier = User.find_by(params[:id])
  #end
end
