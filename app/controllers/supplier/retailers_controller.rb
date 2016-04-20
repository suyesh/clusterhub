class Supplier::RetailersController < Supplier::ApplicationController
    def index
        @retailers = current_user.retailers.all
    end

    def new
        @retailer = current_user.retailers.build
        @latest_retailer = current_user.retailers.last
    end

    def create
        @retailer = current_user.retailers.new(retailers_params)
        respond_to do |format|
            format.js do
                if @retailer.save
                    @retailers = current_user.retailers.all.order('created_at DESC')
                    flash.now[:notice] = 'Retailer has been successfully added.'
                    render 'success'
                else
                    render 'create'
                end
            end
        end
    end

    private

    def retailers_params
        default_params = {
            password: @default_password,
            password_confirmation: @default_password
        }
        params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code, :tax_id, :ssn, :in_biz, :terms, :email, :password, :password_confirmation).merge(default_params)
     end
end
