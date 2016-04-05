class Admin::RetailersController < Admin::ApplicationController

  before_action :set_retailer, only: [:edit, :update]
  def index
    @retailers = User.all.where(role: 1)
  end

  def new
    @retailer = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

private

def set_retailer
  @retailer = User.find(params[:id])
end
end
