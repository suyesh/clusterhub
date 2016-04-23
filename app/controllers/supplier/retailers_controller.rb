class Supplier::RetailersController < Supplier::ApplicationController
    before_action :gen_default_password, only: [:new, :create]
    before_action :set_retailer, only: [:show]

    def index
        @retailers = current_user.retailers.all
    end

    def new
        @retailer = User.new
        @retailer.fuel_formulas.build
    end

    def create
        @retailer = User.create(retailers_params)
        @retailer.user_supplier = current_user.role
        @retailer.supplier_number = current_user.id
        respond_to do |format|
            format.js do
                if @retailer.save
                    @retailer.retailer!
                    current_user.retailers << @retailer
                    @retailer.suppliers << current_user
                    @retail_price = @retailer.retail_prices.create
                    @retailer.fuel_formulas.each do |formula|
                        supplier_fuel = current_user.fuel_prices.last.fuel_products.find_by(fuel: formula.fuel)
                        @retail_price.retail_products.create(fuel: formula.fuel, price: formula.margin + supplier_fuel.price)
                    end
                    @retailers = current_user.retailers.all.order('created_at DESC')
                    flash.now[:notice] = 'Retailer has been successfully added.'
                    render 'success'
                else
                    flash.now[:alert] = 'something went wrong. Please check your form.'
                    render 'new'
                end
            end
        end
    end

    def show
        @retail_prices = @retailer.retail_prices.all.order('created_at DESC').offset(1)
        @latest_fuel_price = @retailer.retail_prices.last
    end

    private

    def set_retailer
      @retailer = current_user.retailers.find(params[:id])
    end

    def gen_default_password
        @default_password = SecureRandom.hex(5)
    end

    def retailers_params
        default_params = {
            password: @default_password,
            password_confirmation: @default_password
        }
        params.require(:user).permit(:first_name, :last_name, :business_name, :cell_number, :email, :password, :password_confirmation, fuel_formulas_attributes: [:fuel, :margin, :_destroy, :id]).merge(default_params)
     end
end
