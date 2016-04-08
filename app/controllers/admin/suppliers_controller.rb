class Admin::SuppliersController < Admin::ApplicationController
  before_action :set_supplier, only: [:edit, :update]
  def index
    @suppliers = User.all.where(role: 2)
  end

  def new
    @supplier = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_supplier
    @supplier = User.find(params[:id])
  end
end
