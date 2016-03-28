class Supplier::ContactsController < Supplier::ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy, :show]

  def index
    @contacts = current_user.contacts.all.order("created_at DESC")
  end

  def new
    @contact = current_user.contacts.build
    @latest_contact = current_user.contacts.last
  end

  def create
    @contact = current_user.contacts.build(contacts_params)
    if @contact.save
    @contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + @contact.c_regular,
                                    r_medium: current_user.fuel_prices.last.medium + @contact.c_medium,
                                    r_premium: current_user.fuel_prices.last.premium + @contact.c_premium,
                                    r_diesel: current_user.fuel_prices.last.diesel + @contact.c_diesel
                                  )
      flash[:notice] = 'Retailer has been successfully added.'
      redirect_to supplier_contacts_path
    else
      flash.now[:alert] = 'Something went wrong. Check your form and re-try.'
      render 'new'
    end
  end

  def show
    @contact_price = @contact.retail_prices.last
  end

  def edit
  end

  def update
    if @contact.update(contacts_params)
      @contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + @contact.c_regular,
                                      r_medium: current_user.fuel_prices.last.medium + @contact.c_medium,
                                      r_premium: current_user.fuel_prices.last.premium + @contact.c_premium,
                                      r_diesel: current_user.fuel_prices.last.diesel + @contact.c_diesel
                                    )
      flash[:notice] = "Contact successfully Updated."
      redirect_to supplier_contacts_path
    else
      flash.now[:alert] = 'Something went wrong. Check your form and re-try.'
      render 'edit'
    end
  end

  def destroy
  end

  private

  def contacts_params
    params.require(:contact).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code,:in_biz,:email, :c_regular, :c_medium, :c_premium, :c_diesel, :c_delivery)
  end

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end
end
