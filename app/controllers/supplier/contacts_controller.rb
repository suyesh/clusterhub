class Supplier::ContactsController < Supplier::ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy, :show]

  def index
    @contacts = current_user.contacts.all
  end

  def new
    @contact = current_user.contacts.build
    @latest_contact = current_user.contacts.last
  end

  def create
    @contact = current_user.contacts.build(contacts_params)
    if @contact.save
      flash[:notice] = 'Retailer has been successfully added.'
      redirect_to supplier_retailers_path
    else
      flash.now[:alert] = 'Something went wrong. Check your form and re-try.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def contacts_params
    params.require(:contact).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code,:in_biz,:email)
  end

  def set_contact
    @retailer = Contact.find(:id)
  end
end
