class Retailer::StationsController < Retailer::ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    @station.retailer = current_user
    if @station.save
      redirect_to @station, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to @station, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_url, notice: 'Station was successfully destroyed.'
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:brand, :business_name, :tax_id, :phone_number, :contact_person, :cell_number, :address1, :address2, :city, :state, :zip, :station_reg_number, :retailer_id)
  end
end
