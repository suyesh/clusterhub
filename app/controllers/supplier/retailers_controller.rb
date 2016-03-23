class Supplier::RetailersController < Supplier::ApplicationController
  def index
    @retailers = @supplier.retailers.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_supplier
  end

  def retailer_params
  end
end
