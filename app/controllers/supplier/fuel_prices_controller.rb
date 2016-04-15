class Supplier::FuelPricesController < Supplier::ApplicationController
    before_action :set_fuel_price, only: [:edit, :update]

    def index
        @fuel_prices = current_user.fuel_prices.all.order('created_at DESC')
        @latest_fuel_price = current_user.fuel_prices.last
        @fuel_price = current_user.fuel_prices.build
        @fuel_price.fuel_products.build
    end

    def new
        @fuel_price = current_user.fuel_prices.build
        @fuel_price.fuel_products.build
    end

    def create
        @fuel_price = current_user.fuel_prices.new(fuel_price_params)
        respond_to do |format|
            format.js do
                if @fuel_price.save
                    @fuel_prices = current_user.fuel_prices.all.order('created_at DESC')
                    flash.now[:notice] = "You have successfully Added new Fuel Price. Petrohub sent out #{current_user.contacts.count} Text messages with updated price to your #{current_user.contacts.count} retailers."
                    render 'success'
                else
                    flash.now[:alert] = "You need to add atleast one Fuel product price. You cannot have multiple same types of Fuel selected."
                    render 'new'
               end
            end
        end
    end

    def edit
        respond_to do |format|
            format.js do
                render 'edit'
            end
        end
    end

    def update
        respond_to do |format|
            format.js do
                if @fuel_price.update(fuel_price_params)
                    @fuel_prices = current_user.fuel_prices.all.order('created_at DESC')
                    flash.now[:notice] = "Fuel Price has been successfully updated. And we sent out Text mesagges with updated price to #{current_user.contacts.count} retailers."
                    render 'success'
                else
                    render 'edit'
                end
            end
        end
    end

    private

    def fuel_price_params
        params.require(:fuel_price).permit(fuel_products_attributes: [:fuel, :price, :_destroy, :id])
    end

    def set_fuel_price
        @fuel_price = FuelPrice.find(params[:id])
    end
end
