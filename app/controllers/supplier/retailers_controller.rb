class Supplier::RetailersController < Supplier::ApplicationController
    def index
        @retailers = User.where(role: :retailer)
    end

    def new
        @retailer = User.new
    end

    def create
    end

    private

    def retailer_params
        default_params = {
            password: @default_password,
            password_confirmation: @default_password
        }
        params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code, :tax_id, :ssn, :in_biz, :terms, :email, :password, :password_confirmation).merge(default_params)
     end
end
