class Supplier::RetailersController < Supplier::ApplicationController
    before_action :gen_default_password, only: [:new, :create]

    def index
        @retailers = current_user.retailers.all
    end

    def new
        @retailer = User.new
        @retailer.fuel_formulas.build
    end

    def create
        @retailer = User.create(retailers_params)
        @retailer.user_supplier = current_user
        respond_to do |format|
            format.js do
                if @retailer.save
                    @retailer.retailer!
                    current_user.retailers << @retailer
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

    private

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
