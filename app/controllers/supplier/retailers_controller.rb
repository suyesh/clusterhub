class Supplier::RetailersController < Supplier::ApplicationController
    before_action :gen_default_password, only: [:new, :create]
    before_action :set_retailer, only: [:show, :edit, :update]
    before_action :set_twilio, only: [:create, :edit, :update]

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
                    @retailers = current_user.retailers.all.order('created_at DESC')
                    unless current_user.fuel_prices.empty?
                        @fuel = nil
                        @retail_price = @retailer.retail_prices.create
                        @retailer.fuel_formulas.sort.each do |formula|
                            current_user.fuel_prices.last.fuel_products.sort.each do |product|
                                if formula.fuel == product.fuel
                                    @fuel = product.fuel
                                    @retail_price.retail_products.create(fuel: @fuel, price: product.price + formula.margin)
                                end
                            end
                        end

                        products = []
                        @retail_price.retail_products.each do |product|
                            products << product.fuel + ' ' + ':' + ' ' + '$' + product.price.to_s
                        end
                        @pricerocket = current_user.pricerockets.create(to: @retailer.cell_number, body: "Hey there! #{@retailer.first_name}. #{current_user.first_name} from #{current_user.business_name} just added you to their Network at Petrohub. Their current Fuel price is #{products.join(', ')}")
                        @client.messages.create(
                            from: '+18482299159',
                            to: "+1#{@retailer.cell_number}",
                            body: "Hey there! #{@retailer.first_name}. #{current_user.first_name} from #{current_user.business_name} just added you to their Network at Petrohub. Their current Fuel price is #{products.join(', ')}"
                        )
                        @pricerocket.sent!
                  end
                    flash.now[:notice] = 'Retailer has been successfully added.'
                    render 'success'

                else
                    flash.now[:alert] = 'something went wrong. Please check your form.'
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
        if @retailer.update(retailers_params)
            @fuel = nil
            @retail_price = @retailer.retail_prices.create
            @retailer.fuel_formulas.sort.each do |formula|
                current_user.fuel_prices.last.fuel_products.sort.each do |product|
                    if formula.fuel == product.fuel
                        @fuel = product.fuel
                        @retail_price.retail_products.create(fuel: @fuel, price: product.price + formula.margin)
                    end
                end
            end
            products = []
            @retail_price.retail_products.each do |product|
                products << product.fuel + ' ' + ':' + ' ' + '$' + product.price.to_s
            end
            @pricerocket = current_user.pricerockets.create(to: @retailer.cell_number, body: "Hey there! #{@retailer.first_name}. #{current_user.first_name} from #{current_user.business_name} just updated your account on Petrohub. Their current Fuel price is #{products.join(', ')}")
            @client.messages.create(
                from: '+18482299159',
                to: "+1#{@retailer.cell_number}",
                body: "Hey there! #{@retailer.first_name}. #{current_user.first_name} from #{current_user.business_name} just updated your account on Petrohub. Their current Fuel price is #{products.join(', ')}"
            )
            @pricerocket.sent!
            flash[:notice] = 'Retailer successfully Updated.'
            render 'edit_success'
        else
            flash.now[:alert] = 'Something went wrong. Check your form and re-try.'
            render 'edit'
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

    def set_twilio
        require 'twilio-ruby'
        @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    end
end
