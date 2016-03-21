class Supplier::ContactsController < Supplier::ApplicationController

  def index
  end

  def new
    @contact = Contact.new
  end

  private

end
